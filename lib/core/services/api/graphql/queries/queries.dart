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

const mediaListCollectionQuery = '''
query MediaListCollection(\$userName: String, \$userId: Int, \$type: MediaType) {
  MediaListCollection(userName: \$userName, userId: \$userId, type: \$type) {
    lists {
      entries {
        media {
          id
          idMal
          title {
            english
          }
          averageScore
          bannerImage
          chapters
          countryOfOrigin
          coverImage {
            large
          }
          description
          duration
          endDate {
            day
            month
            year
          }
          startDate {
            day
            month
            year
          }
          episodes
          genres
          format
          isAdult
          popularity
          meanScore
          season
          isFavourite
          nextAiringEpisode {
            episode
            airingAt
          }
        }
      }
      name
      isCustomList
    }
    hasNextChunk
  }
}
''';