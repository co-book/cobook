<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
       <meta name="description" content="">
       <meta name="viewport" content="width=device-width, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
        <link rel="stylesheet" href="/cobook/resources/epub/css/normalize.css">
        <link rel="stylesheet" href="/cobook/resources/epub/css/main.css">
        <link rel="stylesheet" href="/cobook/resources/epub/css/popup.css">
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
        <script src="/cobook/resources/epub/libs/zip.min.js"></script>
 <script>
            "use strict";

            document.onreadystatechange = function () {
              if (document.readyState == "complete") {
                EPUBJS.filePath = "/cobook/resources/epub/js/libs/";
                EPUBJS.cssPath = window.location.href.replace(window.location.hash, '').replace('index.html', '') + "css/";
                // fileStorage.filePath = EPUBJS.filePath;

                window.reader = ePubReader("/cobook/resources/epub/victorHugo.epub");
                /*
                A Christmas Carol in Prose_ Being a Ghost Story of Christmas by Charles Dickens.epub
                A Tale of Two Cities by Charles Dickens.epub
                Alice's Adventures in Wonderland by Lewis Carroll.epub
                Pride and Prejudice by Jane Austen.epub
                theAdventuresofSherlockHolmesbyArthurConanDoyle.epub
                
                The Romance of Lust.epub
                victorHugo.epub
                hammingway.epub
                Hermann Hesse.epub
                janeOstin.epub
                
                
                moby-dick.epub  
              */
              }
            };

        </script>
        <!-- File Storage -->
        <!-- <script src="js/libs/localforage.min.js"></script> -->

        <!-- Full Screen -->
        <script src="/cobook/resources/epub/libs/screenfull.min.js"></script>

        <!-- Render -->
        <script src="/cobook/resources/epub/build/epub.js"></script>

        <!-- Hooks -->
        <script src="/cobook/resources/epub/build/hooks.js"></script>

        <!-- Reader 
        <script src="js/reader.min.js"></script>-->
        <script src="/cobook/resources/epub/build/reader.js"></script>
        <script src="/cobook/resources/epub/cobookmark.js"></script>

        <!-- Plugins -->
         <script src="/cobook/resources/epub/plugins/search.js"></script>

        <!-- Highlights -->
        <!-- <script src="js/libs/jquery.highlight.js"></script> -->
        <!-- <script src="js/hooks/extensions/highlight.js"></script> -->
        
<title>뷰어</title>
</head>
<body>

<div id="sidebar">
        <div id="panels">
          <input id="searchBox" placeholder="search" type="search">

          <a id="show-Search" class="show_view icon-search" data-view="Search">Search</a>
          <a id="show-Toc" class="show_view icon-list-1 active" data-view="Toc">TOC</a>
          <a id="show-Bookmarks" class="show_view icon-bookmark" data-view="Bookmarks">Bookmarks</a>
          <a id="show-Notes" class="show_view icon-edit" data-view="Notes">Notes</a>

        </div>
        <div id="tocView" class="view">
        </div>
        <div id="searchView" class="view">
          <ul id="searchResults"></ul>
        </div>
        <div id="bookmarksView" class="view">
          <ul id="bookmarks"></ul>
        </div>
        <div id="notesView" class="view">
          <div id="new-note">
            <textarea id="note-text"></textarea>
            <button id="note-anchor">Anchor</button>
          </div>
          <ol id="notes"></ol>
        </div>
      </div>
      <div id="main">

        <div id="titlebar">
          <div id="opener">
            <a id="slider" class="icon-menu">Menu</a>
          </div>
          <div id="metainfo">
            <span id="book-title"></span>
            <span id="title-seperator">&nbsp;&nbsp;–&nbsp;&nbsp;</span>
            <span id="chapter-title"></span>
          </div>
          <div id="title-controls">
            <a id="bookmark" class="icon-bookmark-empty">Bookmark</a>
            <a id="setting" class="icon-cog">Settings</a>
            <a id="fullscreen" class="icon-resize-full">Fullscreen</a>
          </div>
        </div>

        <div id="divider"></div>
        <div id="prev" class="arrow">‹</div>
        <div id="viewer"></div>
        <div id="next" class="arrow">›</div>

        <div id="loader"><img src="/cobook/resources/epub/img/loader.gif"></div>
      </div>
      <div class="modal md-effect-1" id="settings-modal">
          <div class="md-content">
              <h3>Settings</h3>
              <div>
                  <p>
                    <input type="checkbox" id="sidebarReflow" name="sidebarReflow">Reflow text when sidebars are open.
                  </p>
              </div>
              <div class="closer icon-cancel-circled"></div>
          </div>
      </div>
      <div class="overlay"></div>
    </body>
</html>