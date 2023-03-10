import 'dart:convert';

import 'package:http/http.dart' as http;

String apiKey = "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";

Future sendTextCompletionRequest(String message) async {
  String baseUrl = "https://api.openai.com/v1/completions";
  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Authorization": "Bearer $apiKey"
  };
  var res = await http.post(Uri.parse(baseUrl),
      headers: headers,
      body: json.encode({
        "model": "text-davinci-003",
        "prompt": message,
        "max_tokens": 200,
        "temperature": 0,
        "top_p": 1,
        "n": 1,
        "stream": false,
        "logprobs": null,
      }));
  if (res.statusCode == 200) {
    return jsonDecode(res.body);
  }
}
