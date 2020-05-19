import pandas as pd
import numpy as np

# Import data
dataset1 = pd.read_csv('/Users/murat.turkoglu/Downloads/imdbdb/name.basics.tsv', encoding='utf-8', sep='\t')
dataset1['primaryName'] = np.where(np.equal(dataset1['primaryName'], r'\N'),'', dataset1['primaryName'])
dataset1['primaryProfession'] = np.where(np.equal(dataset1['primaryProfession'], r'\N'),'', dataset1['primaryProfession'])
dataset1['knownForTitles'] = np.where(np.equal(dataset1['knownForTitles'], r'\N'),'', dataset1['knownForTitles'])
dataset1['birthYear'] = pd.to_numeric(dataset1['birthYear'], errors='coerce').fillna(0).astype(int)
dataset1['deathYear'] = pd.to_numeric(dataset1['deathYear'], errors='coerce').fillna(0).astype(int)
dataset1.to_csv('/Users/murat.turkoglu/Downloads/imdbdb/name_basics.tsv')


dataset2 = pd.read_csv('/Users/murat.turkoglu/Downloads/imdbdb/title.akas.tsv', encoding='utf-8', sep='\t')
dataset2['title'] = np.where(np.equal(dataset2['title'],r'\N'),'', dataset2['title'])
dataset2['region'] = np.where(np.equal(dataset2['region'], r'\N'),'', dataset2['region'])
dataset2['language'] = np.where(np.equal(dataset2['language'], r'\N'),'', dataset2['language'])
dataset2['types'] = np.where(np.equal(dataset2['types'], r'\N'),'', dataset2['types'])
dataset2['attributes'] = np.where(np.equal(dataset2['attributes'], r'\N'),'', dataset2['attributes'])
dataset2['ordering'] = pd.to_numeric(dataset2['ordering'], errors='coerce').fillna(0).astype(int)
dataset2['isOriginalTitle'] = pd.to_numeric(dataset2['isOriginalTitle'], errors='coerce').fillna(0).astype(int)

dataset2.to_csv('/Users/murat.turkoglu/Downloads/imdbdb/title_akas.tsv')

dataset3 = pd.read_csv('/Users/murat.turkoglu/Downloads/imdbdb/title.basics.tsv', encoding='utf-8', sep='\t')
dataset3['titleType'] = np.where(np.equal(dataset3['titleType'], r'\N'),'', dataset3['titleType'])
dataset3['primaryTitle'] = np.where(np.equal(dataset3['primaryTitle'], r'\N'),'', dataset3['primaryTitle'])
dataset3['originalTitle'] = np.where(np.equal(dataset3['originalTitle'], r'\N'),'', dataset3['originalTitle'])
dataset3['genres'] = np.where(np.equal(dataset3['genres'], r'\N'),'', dataset3['genres'])
dataset3['isAdult'] = np.where(dataset3['isAdult'] > 1, 0, dataset3['isAdult'])
dataset3['isAdult'] = pd.to_numeric(dataset3['isAdult'], errors='coerce').fillna(0).astype(int)
dataset3['startYear'] = pd.to_numeric(dataset3['startYear'], errors='coerce').fillna(0).astype(int)
dataset3['endYear'] = pd.to_numeric(dataset3['endYear'], errors='coerce').fillna(0).astype(int)
dataset3['runtimeMinutes'] = pd.to_numeric(dataset3['runtimeMinutes'], errors='coerce').fillna(0).astype(int)
dataset3.to_csv('/Users/murat.turkoglu/Downloads/imdbdb/title_basics.tsv')


dataset4 = pd.read_csv('/Users/murat.turkoglu/Downloads/imdbdb/title.crew.tsv', encoding='utf-8', sep='\t')
dataset4['directors'] = np.where(np.equal(dataset4['directors'], r'\N'),'', dataset4['directors'])
dataset4['writers'] = np.where(np.equal(dataset4['writers'], r'\N'),'', dataset4['writers'])
dataset4.to_csv('/Users/murat.turkoglu/Downloads/imdbdb/title_crew.tsv')


dataset5 = pd.read_csv('/Users/murat.turkoglu/Downloads/imdbdb/title.episode.tsv', encoding='utf-8', sep='\t')
dataset5['seasonNumber'] = pd.to_numeric(dataset5['seasonNumber'], errors='coerce').fillna(0).astype(int)
dataset5['episodeNumber'] = pd.to_numeric(dataset5['episodeNumber'], errors='coerce').fillna(0).astype(int)
dataset5.to_csv('/Users/murat.turkoglu/Downloads/imdbdb/title_episode.tsv')


dataset6 = pd.read_csv('/Users/murat.turkoglu/Downloads/imdbdb/title.principals.tsv', encoding='utf-8', sep='\t')
dataset6['ordering'] = pd.to_numeric(dataset6['ordering'], errors='coerce').fillna(0).astype(int)
dataset6['category'] = np.where(np.equal(dataset6['category'], r'\N'),'', dataset6['category'])
dataset6['job'] = np.where(np.equal(dataset6['job'], r'\N'),'', dataset6['job'])
dataset6['characters'] = np.where(np.equal(dataset6['characters'], r'\N'),'', dataset6['characters'])
dataset6.to_csv('/Users/murat.turkoglu/Downloads/imdbdb/title_principals.tsv')

dataset7 = pd.read_csv('/Users/murat.turkoglu/Downloads/imdbdb/title.ratings.tsv', encoding='utf-8', sep='\t')
dataset7['averageRating'] = pd.to_numeric(dataset7['averageRating'], errors='coerce').fillna(0).astype(float)
dataset7['numVotes'] = pd.to_numeric(dataset7['numVotes'], errors='coerce').fillna(0).astype(int)
dataset7.to_csv('/Users/murat.turkoglu/Downloads/imdbdb/title_ratings.tsv')
