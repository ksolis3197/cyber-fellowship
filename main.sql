SELECT title_master.TitleId,TitleName,
title_release.ReleaseDate,
distributor.DistributorName,
genre.GenreName,
title_boxoffice.DomesticGross,
title_boxoffice.AdjustedOpeningWeekend OpeningWeekend
FROM `universal-aot.magic.title_master` title_Master
LEFT JOIN `universal-aot.magic.title_boxoffice` title_boxoffice on title_master.TitleId =
title_boxoffice.TitleId
LEFT JOIN `universal-aot.magic.title_release` title_release on title_master.TitleId = title_release.TitleId
LEFT JOIN `universal-aot.magic.distributor` distributor on title_master.StudioDistributorId =
distributor.DistributorId
LEFT JOIN `universal-aot.magic.title_genre` title_genre on title_master.TitleId = title_genre.TitleId
INNER JOIN `universal-aot.magic.genre` genre on title_genre.GenreId = genre.GenreId
WHERE LOWER(TitleName) like LOWER('%sing 2%')
AND title_genre.GenreRank = 1
