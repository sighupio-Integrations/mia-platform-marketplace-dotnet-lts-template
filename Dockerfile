# Copyright (c) 2017-present SIGHUP s.r.l All rights reserved.
# Use of this source code is governed by a proprietary
# license that can be found in the LICENSE file.

FROM reg.sighup.io/r/library/dotnet-core/sdk:6.0 AS build

WORKDIR /app

COPY ./src .

RUN dotnet restore
RUN dotnet publish -c Release -o out

FROM reg.sighup.io/r/library/dotnet-core/aspnet:6.0 AS runtime

WORKDIR /app

COPY --from=build /app/out ./

# ENV ASPNETCORE_ENVIRONMENT Development

EXPOSE 80

ENTRYPOINT ["dotnet", "6.0.dll"]
