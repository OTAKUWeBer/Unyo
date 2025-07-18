const viewerQuery =
'''
query Viewer {
  Viewer {
    id
    bannerImage
    avatar {
      medium
    }
    mediaListOptions {
      animeList {
        customLists
      }
      mangaList {
        customLists
      }
      scoreFormat
    }
    name
  }
}
''';
