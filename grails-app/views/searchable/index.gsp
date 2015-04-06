<%@ page import="org.springframework.util.ClassUtils"%>
<%@ page import="grails.plugin.searchable.internal.lucene.LuceneUtils"%>
<%@ page import="grails.plugin.searchable.internal.util.StringQueryUtils"%>
<html>
<head>
	<meta name="layout" content="semantic" />
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<title><g:if test="${ params.q && params.q?.trim() != '' }">${ params.q } - </g:if>Search</title>
	<script type="text/javascript">
		var focusQueryInput = function() {
		    document.getElementById("q").focus();
	    }
	</script>
	<style>
		.paging {
			text-align: center;
		}
	</style>
</head>
<body onload="focusQueryInput();">
	<div id="header" class="ui form">
		<g:form url='[controller: "searchable", action: "index"]' id="searchableForm" name="searchableForm" method="get" class="inline field" style="text-align: center;">
			<g:textField name="q" value="${ params.q }" size="50" />
			<input class="ui button primary" type="submit" value="Search" />
		</g:form>
		<div style="clear: both; display: none;" class="hint">
			See <a href="http://lucene.apache.org/java/docs/queryparsersyntax.html">Lucene query syntax</a> for advanced queries
		</div>
	</div>
	<div id="main" class="ui segment">
		<g:set var="haveQuery" value="${ params.q?.trim() }" />
		<g:set var="haveResults" value="${ searchResult?.results }" />
		<g:if test="${haveQuery && haveResults}">
			<div class="title">
				<span>
					Showing <b>${ searchResult.offset + 1 }</b> - <b>${ searchResult.results.size() + searchResult.offset }</b> of <b>${ searchResult.total }</b> results for <b>${ params.q }</b>
				</span>
			</div>
		</g:if>
		<g:if test="${haveQuery && !haveResults && !parseException}">
			<h2 class="ui dividing header">Nothing matched your query - <i> ${ params.q }</i></h2>
			<g:if test="${ !searchResult?.suggestedQuery }">
				<p>Suggestions:</p>
				<ul>
					<li>
						Try a suggested query: <g:link controller="searchable" action="index" params="[q: params.q, suggestQuery: true]">Search again with the <strong>suggestQuery</strong> option</g:link><br />
					</li>
				</ul>
			</g:if>
		</g:if>
		<g:if test="${ searchResult?.suggestedQuery }">
			<p>
				Did you mean
				<g:link controller="searchable" action="index" params="[q: searchResult.suggestedQuery]">
					${ StringQueryUtils.highlightTermDiffs(params.q.trim(), searchResult.suggestedQuery) }
				</g:link>
				?
			</p>
		</g:if>
		<g:if test="${ parseException }">
			<p>
				Your query - <strong>${ params.q }</strong> - is not valid.
			</p>
			<p>Suggestions:</p>
			<ul>
				<li>Fix the query: see <a href="http://lucene.apache.org/java/docs/queryparsersyntax.html">Lucene query syntax</a> for examples</li>
				<g:if test="${LuceneUtils.queryHasSpecialCharacters(params.q)}">
					<li>
						Remove special characters like <strong>" - [ ]</strong>, before searching, eg, <em><strong>${ LuceneUtils.cleanQuery(params.q) }</strong></em><br />
						<g:link controller="searchable" action="index" params="[q: LuceneUtils.cleanQuery(params.q)]">Search again with special characters removed</g:link>
					</li>
					<li>
						Escape special characters like <strong>" - [ ]</strong> with <strong>\</strong>, eg, <em><strong>${ LuceneUtils.escapeQuery(params.q) }</strong></em><br />
						<g:link controller="searchable" action="index" params="[q: LuceneUtils.escapeQuery(params.q)]">Search again with special characters escaped</g:link>
					</li>
				</g:if>
			</ul>
		</g:if>
		<g:if test="${ haveResults }">
			<div class="ui feed">
				<g:each var="result" in="${ searchResult.results }" status="index">
					<g:set var="className" value="${ClassUtils.getShortName(result.getClass())}" />
					<g:set var="name" value="${ result.toString() }" />
					<g:set var="link" value="${ createLink(controller: className[0].toLowerCase() + className[1..-1], action: 'show', id: result.id) }" />
					<div class="event">
						<div class="label">
							<div class="ui small statistic">
								<div class="value">
									${ index + 1 + searchResult.offset }
								</div>
							</div>
						</div>
						<div class="content">
							<div class="summary">
								<a href="${ link }">
									${ name }
								</a>
								<div class="date">
									${ searchResult.scores[index].round(4) } relevance
								</div>
							</div>
							<g:if test="${ searchResult.highlights && searchResult.highlights[index].size() > 0 }">
								<div class="extra text">
									${ searchResult.highlights[index].join('  ') }
								</div>
							</g:if>
						</div>
					</div>
				</g:each>
			</div>
			<div>
				<div class="paging">
					<g:if test="${ haveResults }">
						<g:set var="totalPages" value="${ Math.ceil(searchResult.total / searchResult.max) }" />
						<g:if test="${ totalPages == 1 }">
							<span class="currentStep">1</span>
						</g:if>
						<g:else>
							<g:paginate controller="searchable" action="index" params="[q: params.q]" total="${ searchResult.total }" prev="&lt; previous" next="next &gt;" />
						</g:else>
					</g:if>
				</div>
			</div>
		</g:if>
	</div>
	<script>
		$(function() {
			$('.prevLink, .nextLink, .step, .currentStep').addClass('ui small button');
			$('.currentStep').addClass('primary');
		});
	</script>
</body>
</html>
