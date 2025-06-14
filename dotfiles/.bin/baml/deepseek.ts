#!/usr/bin/env bun

import { b } from "./baml_client";

async function main() {
  // Read from either stdin or command line arguments
  let input = "";
  if (process.argv.length > 2) {
    // Join all command line arguments after the first two (node and script name)
    input = process.argv.slice(2).join(" ");
  } else {
    // Read from stdin
    const chunks: string[] = [];
    for await (const chunk of process.stdin) {
      chunks.push(chunk);
    }
    input = chunks.join("");
  }

  const stream = b.stream.AskR1(input);
  for await (const partial of stream) {
    console.log(partial ?? "");
  }
}

main();
