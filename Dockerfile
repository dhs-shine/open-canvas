FROM langchain/langgraphjs-api:20
ADD . /deps/open-canvas
ENV LANGSERVE_GRAPHS='{"agent":"./apps/agents/src/open-canvas/index.ts:graph","reflection":"./apps/agents/src/reflection/index.ts:graph","thread_title":"./apps/agents/src/thread-title/index.ts:graph","summarizer":"./apps/agents/src/summarizer/index.ts:graph","web_search":"./apps/agents/src/web-search/index.ts:graph"}'
WORKDIR /deps/open-canvas
RUN yarn install
RUN (test ! -f /api/langgraph_api/js/build.mts && echo "Prebuild script not found, skipping") || tsx /api/langgraph_api/js/build.mts