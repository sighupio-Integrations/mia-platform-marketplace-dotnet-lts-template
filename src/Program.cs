// Copyright (c) 2017-present SIGHUP s.r.l All rights reserved.
// Use of this source code is governed by a proprietary
// license that can be found in the LICENSE file.

using Prometheus;

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.UseRouting();
app.UseMetricServer();
app.UseHttpMetrics();

app.MapGet("/", () => "Hello World!");
app.MapGet("/livez", () => "OK");
app.MapGet("/readyz", () => "OK");

app.Run();
