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
// {
//   "username" : userName,
//   "userId": 0,
//   "type" : "ANIME" or "MANGA"
// }
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
            native
            romaji
            userPreferred
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
          status
        }
      }
      name
      isCustomList
    }
    hasNextChunk
  }
}
''';
// {
//   "sort": "TIME_DESC",
//   "page": 1,
//   "perPage": 50,
// }
const animeRecentlyReleasedQuery = '''
query Page(\$sort: [AiringSort], \$page: Int, \$perPage: Int, \$notYetAired: Boolean) {
  Page(page: \$page, perPage: \$perPage) {
    airingSchedules(sort: \$sort, notYetAired: \$notYetAired) {
      media {
        nextAiringEpisode {
          episode
          airingAt
        }
        status
        isFavourite
        season
        id
        idMal
        isAdult
        meanScore
        popularity
        genres
        format
        episodes
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
        duration
        description
        coverImage {
          large
        }
        countryOfOrigin
        chapters
        bannerImage
        averageScore
        title {
          english
          native
          romaji
          userPreferred
        }
      }
    }
  }
}
''';
//sort and type are important
// {
//   "page": 1,
//   "perPage": 50,
//   "sort": "POPULARITY_DESC" or "TRENDING_DESC",
//   "type": "ANIME" or "MANGA"
// }
const mediaTrendingOrPopularQuery = '''
query Page(\$page: Int, \$perPage: Int, \$sort: [MediaSort], \$type: MediaType) {
  Page(page: \$page, perPage: \$perPage) {
    media(sort: \$sort, type: \$type) {
      nextAiringEpisode {
          episode
          airingAt
        }
        status
        isFavourite
        season
        id
        idMal
        isAdult
        meanScore
        popularity
        genres
        format
        episodes
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
        duration
        description
        coverImage {
          large
        }
        countryOfOrigin
        chapters
        bannerImage
        averageScore
        title {
          english
          native
          romaji
          userPreferred
        }
    }
  }
}

''';
// {
// "page" : 1,
// "perPage" : 50,
// "sort": "TRENDING_DESC",
// "type": "ANIME",
// "endDateGreater": 20250612,
// "endDateLesser": 20250712
// }
const mediaRecentlyCompletedQuery = '''
query Page(\$page: Int, \$perPage: Int, \$sort: [MediaSort], \$type: MediaType, \$endDateGreater: FuzzyDateInt, \$endDateLesser: FuzzyDateInt) {
  Page(page: \$page, perPage: \$perPage) {
    media(sort: \$sort, type: \$type, endDate_greater: \$endDateGreater, endDate_lesser: \$endDateLesser) {
      nextAiringEpisode {
          episode
          airingAt
        }
        status
        isFavourite
        season
        id
        idMal
        isAdult
        meanScore
        popularity
        genres
        format
        episodes
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
        duration
        description
        coverImage {
          large
        }
        countryOfOrigin
        chapters
        bannerImage
        averageScore
        title {
          english
          native
          romaji
          userPreferred
        }
    }
  }
}
''';
// {
// "page" : 1,
// "perPage" : 50,
// "type": "ANIME" or "MANGA",
// "sort": "POPULARITY_DESC" or "TRENDING_DESC",
// "startDateGreater": 20250724
// }
const mediaUpcomingQuery = '''
query Page(\$page: Int, \$perPage: Int, \$sort: [MediaSort], \$type: MediaType, \$startDateGreater: FuzzyDateInt) {
  Page(page: \$page, perPage: \$perPage) {
    media(sort: \$sort, type: \$type, startDate_greater: \$startDateGreater) {
      nextAiringEpisode {
          episode
          airingAt
        }
        status
        isFavourite
        season
        id
        idMal
        isAdult
        meanScore
        popularity
        genres
        format
        episodes
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
        duration
        description
        coverImage {
          large
        }
        countryOfOrigin
        chapters
        bannerImage
        averageScore
        title {
          english
          native
          romaji
          userPreferred
        }
    }
  }
}
''';