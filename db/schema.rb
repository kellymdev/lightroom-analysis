# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "Adobe_AdditionalMetadata", primary_key: "id_local", force: :cascade do |t|
    t.string  "id_global",                                          null: false
    t.integer "additionalInfoSet",         default: 0,              null: false
    t.integer "embeddedXmp",               default: 0,              null: false
    t.integer "externalXmpIsDirty",        default: 0,              null: false
    t.integer "image"
    t.integer "incrementalWhiteBalance",   default: 0,              null: false
    t.string  "internalXmpDigest"
    t.integer "isRawFile",                 default: 0,              null: false
    t.string  "lastSynchronizedHash"
    t.float   "lastSynchronizedTimestamp", default: "-63113817600", null: false
    t.string  "metadataPresetID"
    t.float   "metadataVersion"
    t.integer "monochrome",                default: 0,              null: false
    t.string  "xmp",                       default: "",             null: false
    t.index ["id_global"], name: "sqlite_autoindex_Adobe_AdditionalMetadata_1", unique: true
    t.index ["image", "externalXmpIsDirty"], name: "index_Adobe_AdditionalMetadata_imageAndStatus"
  end

  create_table "Adobe_imageDevelopBeforeSettings", primary_key: "id_local", force: :cascade do |t|
    t.string  "beforeDigest"
    t.float   "beforeHasDevelopAdjustments"
    t.string  "beforePresetID"
    t.string  "beforeText"
    t.integer "developSettings"
    t.index ["developSettings"], name: "index_Adobe_imageDevelopBeforeSettings_developSettings"
  end

  create_table "Adobe_imageDevelopSettings", primary_key: "id_local", force: :cascade do |t|
    t.integer "allowFastRender"
    t.float   "beforeSettingsIDCache"
    t.float   "croppedHeight"
    t.float   "croppedWidth"
    t.string  "digest"
    t.float   "fileHeight"
    t.float   "fileWidth"
    t.integer "grayscale"
    t.integer "hasDevelopAdjustments"
    t.float   "hasDevelopAdjustmentsEx"
    t.string  "historySettingsID"
    t.integer "image"
    t.string  "processVersion"
    t.string  "settingsID"
    t.string  "snapshotID"
    t.string  "text"
    t.float   "validatedForVersion"
    t.string  "whiteBalance"
    t.index ["digest"], name: "index_Adobe_imageDevelopSettings_digest"
    t.index ["image"], name: "index_Adobe_imageDevelopSettings_image"
  end

  create_table "Adobe_imageProofSettings", primary_key: "id_local", force: :cascade do |t|
    t.string  "colorProfile"
    t.integer "image"
    t.string  "renderingIntent"
    t.index ["image"], name: "index_Adobe_imageProofSettings_image"
  end

  create_table "Adobe_imageProperties", primary_key: "id_local", force: :cascade do |t|
    t.string  "id_global",        null: false
    t.integer "image"
    t.string  "propertiesString"
    t.index ["id_global"], name: "sqlite_autoindex_Adobe_imageProperties_1", unique: true
    t.index ["image"], name: "index_Adobe_imageProperties_image"
  end

  create_table "Adobe_images", primary_key: "id_local", force: :cascade do |t|
    t.string  "id_global",                                       null: false
    t.float   "aspectRatioCache",       default: "-1",           null: false
    t.string  "captureTime"
    t.string  "colorLabels",            default: "",             null: false
    t.float   "copyCreationTime",       default: "-63113817600", null: false
    t.string  "copyName"
    t.string  "copyReason"
    t.float   "developSettingsIDCache"
    t.string  "fileFormat",             default: "unset",        null: false
    t.float   "fileHeight"
    t.float   "fileWidth"
    t.integer "hasMissingSidecars"
    t.integer "masterImage"
    t.string   "orientation"
    t.string   "originalCaptureTime"
    t.integer "originalRootEntity"
    t.float   "panningDistanceH"
    t.float   "panningDistanceV"
    t.float   "pick",                   default: "0",            null: false
    t.string  "positionInFolder",       default: "z",            null: false
    t.float   "propertiesCache"
    t.string   "pyramidIDCache"
    t.float   "rating"
    t.integer "rootFile",               default: 0,              null: false
    t.float   "sidecarStatus"
    t.float    "touchCount",             default: "0",            null: false
    t.float   "touchTime",              default: "0",            null: false
    t.index ["captureTime"], name: "index_Adobe_images_captureTime"
    t.index ["id_global"], name: "sqlite_autoindex_Adobe_images_1", unique: true
    t.index ["masterImage"], name: "index_Adobe_images_masterImage"
    t.index ["originalRootEntity"], name: "index_Adobe_images_originalRootEntity"
    t.index ["rating", "captureTime"], name: "index_Adobe_images_ratingAndCaptureTime"
    t.index ["rootFile"], name: "index_Adobe_images_rootFile"
  end

  create_table "Adobe_libraryImageDevelopHistoryStep", primary_key: "id_local", force: :cascade do |t|
    t.string   "id_global",             null: false
    t.float   "dateCreated"
    t.string   "digest"
    t.float    "hasDevelopAdjustments"
    t.integer "image"
    t.string   "name"
    t.string   "relValueString"
    t.string   "text"
    t.string    "valueString"
    t.index ["id_global"], name: "sqlite_autoindex_Adobe_libraryImageDevelopHistoryStep_1", unique: true
    t.index ["image", "dateCreated"], name: "index_Adobe_libraryImageDevelopHistoryStep_imageDateCreated"
  end

  create_table "Adobe_libraryImageDevelopSnapshot", primary_key: "id_local", force: :cascade do |t|
    t.string  "id_global",             null: false
    t.string   "digest"
    t.string   "hasDevelopAdjustments"
    t.integer "image"
    t.string   "locked"
    t.string   "name"
    t.string   "snapshotID"
    t.string   "text"
    t.index ["id_global"], name: "sqlite_autoindex_Adobe_libraryImageDevelopSnapshot_1", unique: true
    t.index ["image"], name: "index_Adobe_libraryImageDevelopSnapshot_image"
  end

  create_table "Adobe_namedIdentityPlate", primary_key: "id_local", force: :cascade do |t|
    t.string "id_global",               null: false
    t.string "description"
    t.string "identityPlate"
    t.string "identityPlateHash"
    t.string "moduleFont"
    t.string "moduleSelectedTextColor"
    t.string "moduleTextColor"
    t.index ["description"], name: "index_Adobe_namedIdentityPlate_description"
    t.index ["id_global"], name: "sqlite_autoindex_Adobe_namedIdentityPlate_1", unique: true
    t.index ["identityPlateHash"], name: "index_Adobe_namedIdentityPlate_identityPlateHash"
  end

  create_table "Adobe_variables", primary_key: "id_local", force: :cascade do |t|
    t.string "id_global", null: false
    t.string "name"
    t.string "value"
    t.index ["id_global"], name: "sqlite_autoindex_Adobe_variables_1", unique: true
    t.index ["name"], name: "index_Adobe_variables_name"
  end

  create_table "Adobe_variablesTable", primary_key: "id_local", force: :cascade do |t|
    t.string "id_global",              null: false
    t.string "name"
    t.string "type"
    t.string "value",     default: "", null: false
    t.index ["id_global"], name: "sqlite_autoindex_Adobe_variablesTable_1", unique: true
  end

  create_table "AgFolderContent", primary_key: "id_local", force: :cascade do |t|
    t.string        "id_global",                    null: false
    t.integer "containingFolder", default: 0, null: false
    t.string        "content"
    t.string        "name"
    t.string       "owningModule"
    t.index ["containingFolder"], name: "index_AgFolderContent_containingFolder"
    t.index ["id_global"], name: "sqlite_autoindex_AgFolderContent_1", unique: true
    t.index ["owningModule"], name: "index_AgFolderContent_owningModule"
  end

  create_table "AgHarvestedDNGMetadata", primary_key: "id_local", force: :cascade do |t|
    t.integer "image"
    t.integer "hasFastLoadData"
    t.integer "hasLossyCompression"
    t.integer "isDNG"
    t.integer "isReducedResolution"
    t.index ["hasFastLoadData"], name: "index_AgHarvestedDNGMetadata_hasFastLoadData"
    t.index ["hasLossyCompression"], name: "index_AgHarvestedDNGMetadata_hasLossyCompression"
    t.index ["image", "isDNG", "hasFastLoadData", "hasLossyCompression", "isReducedResolution"], name: "index_AgHarvestedDNGMetadata_byImage"
    t.index ["isDNG"], name: "index_AgHarvestedDNGMetadata_isDNG"
    t.index ["isReducedResolution"], name: "index_AgHarvestedDNGMetadata_isReducedResolution"
  end

  create_table "AgHarvestedExifMetadata", primary_key: "id_local", force: :cascade do |t|
    t.integer "image"
    t.float    "aperture"
    t.integer "cameraModelRef"
    t.integer "cameraSNRef"
    t.float    "dateDay"
    t.float    "dateMonth"
    t.float    "dateYear"
    t.integer "flashFired"
    t.float    "focalLength"
    t.string    "gpsLatitude"
    t.string   "gpsLongitude"
    t.float    "gpsSequence",    default: "0", null: false
    t.integer "hasGPS"
    t.float   "isoSpeedRating"
    t.integer "lensRef"
    t.float  "shutterSpeed"
    t.index ["aperture"], name: "index_AgHarvestedExifMetadata_aperture"
    t.index ["cameraModelRef"], name: "index_AgHarvestedExifMetadata_cameraModelRef"
    t.index ["cameraSNRef"], name: "index_AgHarvestedExifMetadata_cameraSNRef"
    t.index ["dateYear", "dateMonth", "dateDay", "image"], name: "index_AgHarvestedExifMetadata_date"
    t.index ["flashFired"], name: "index_AgHarvestedExifMetadata_flashFired"
    t.index ["focalLength"], name: "index_AgHarvestedExifMetadata_focalLength"
    t.index ["hasGPS", "gpsLatitude", "gpsLongitude", "image"], name: "index_AgHarvestedExifMetadata_gpsCluster"
    t.index ["image"], name: "index_AgHarvestedExifMetadata_image"
    t.index ["isoSpeedRating"], name: "index_AgHarvestedExifMetadata_isoSpeedRating"
    t.index ["lensRef"], name: "index_AgHarvestedExifMetadata_lensRef"
    t.index ["shutterSpeed"], name: "index_AgHarvestedExifMetadata_shutterSpeed"
  end

  create_table "AgHarvestedIptcMetadata", primary_key: "id_local", force: :cascade do |t|
    t.integer "image"
    t.integer "cityRef"
    t.integer "copyrightState"
    t.integer "countryRef"
    t.integer "creatorRef"
    t.integer "isoCountryCodeRef"
    t.integer "jobIdentifierRef"
    t.string   "locationDataOrigination", default: "unset", null: false
    t.float    "locationGPSSequence",     default: "-1",    null: false
    t.integer "locationRef"
    t.integer "stateRef"
    t.index ["cityRef"], name: "index_AgHarvestedIptcMetadata_cityRef"
    t.index ["copyrightState"], name: "index_AgHarvestedIptcMetadata_copyrightState"
    t.index ["countryRef"], name: "index_AgHarvestedIptcMetadata_countryRef"
    t.index ["creatorRef"], name: "index_AgHarvestedIptcMetadata_creatorRef"
    t.index ["image"], name: "index_AgHarvestedIptcMetadata_image"
    t.index ["isoCountryCodeRef"], name: "index_AgHarvestedIptcMetadata_isoCountryCodeRef"
    t.index ["jobIdentifierRef"], name: "index_AgHarvestedIptcMetadata_jobIdentifierRef"
    t.index ["locationRef"], name: "index_AgHarvestedIptcMetadata_locationRef"
    t.index ["stateRef"], name: "index_AgHarvestedIptcMetadata_stateRef"
  end

  create_table "AgHarvestedMetadataWorklist", primary_key: "id_local", force: :cascade do |t|
    t.string "taskID",     default: "",        null: false
    t.string "taskStatus", default: "pending", null: false
    t.string "whenPosted", default: "",        null: false
    t.index ["taskID", "whenPosted", "taskStatus"], name: "index_AgHarvestedMetadataWorklist_taskIDCluster"
    t.index ["taskID"], name: "sqlite_autoindex_AgHarvestedMetadataWorklist_1", unique: true
    t.index ["taskStatus", "whenPosted", "taskID"], name: "index_AgHarvestedMetadataWorklist_statusCluster"
  end

  create_table "AgInternedExifCameraModel", primary_key: "id_local", force: :cascade do |t|
    t.string "searchIndex"
    t.string "value"
    t.index ["searchIndex"], name: "index_AgInternedExifCameraModel_searchIndex"
    t.index ["value"], name: "index_AgInternedExifCameraModel_value"
  end

  create_table "AgInternedExifCameraSN", primary_key: "id_local", force: :cascade do |t|
    t.string "searchIndex"
    t.string "value"
    t.index ["searchIndex"], name: "index_AgInternedExifCameraSN_searchIndex"
    t.index ["value"], name: "index_AgInternedExifCameraSN_value"
  end

  create_table "AgInternedExifLens", primary_key: "id_local", force: :cascade do |t|
    t.string "searchIndex"
    t.string "value"
    t.index ["searchIndex"], name: "index_AgInternedExifLens_searchIndex"
    t.index ["value"], name: "index_AgInternedExifLens_value"
  end

  create_table "AgInternedIptcCity", primary_key: "id_local", force: :cascade do |t|
    t.string "searchIndex"
    t.string "value"
    t.index ["searchIndex"], name: "index_AgInternedIptcCity_searchIndex"
    t.index ["value"], name: "index_AgInternedIptcCity_value"
  end

  create_table "AgInternedIptcCountry", primary_key: "id_local", force: :cascade do |t|
    t.string "searchIndex"
    t.string "value"
    t.index ["searchIndex"], name: "index_AgInternedIptcCountry_searchIndex"
    t.index ["value"], name: "index_AgInternedIptcCountry_value"
  end

  create_table "AgInternedIptcCreator", primary_key: "id_local", force: :cascade do |t|
    t.string "searchIndex"
    t.string "value"
    t.index ["searchIndex"], name: "index_AgInternedIptcCreator_searchIndex"
    t.index ["value"], name: "index_AgInternedIptcCreator_value"
  end

  create_table "AgInternedIptcIsoCountryCode", primary_key: "id_local", force: :cascade do |t|
    t.string "searchIndex"
    t.string "value"
    t.index ["searchIndex"], name: "index_AgInternedIptcIsoCountryCode_searchIndex"
    t.index ["value"], name: "index_AgInternedIptcIsoCountryCode_value"
  end

  create_table "AgInternedIptcJobIdentifier", primary_key: "id_local", force: :cascade do |t|
    t.string "searchIndex"
    t.string "value"
    t.index ["searchIndex"], name: "index_AgInternedIptcJobIdentifier_searchIndex"
    t.index ["value"], name: "index_AgInternedIptcJobIdentifier_value"
  end

  create_table "AgInternedIptcLocation", primary_key: "id_local", force: :cascade do |t|
    t.string "searchIndex"
    t.string "value"
    t.index ["searchIndex"], name: "index_AgInternedIptcLocation_searchIndex"
    t.index ["value"], name: "index_AgInternedIptcLocation_value"
  end

  create_table "AgInternedIptcState", primary_key: "id_local", force: :cascade do |t|
    t.string "searchIndex"
    t.string "value"
    t.index ["searchIndex"], name: "index_AgInternedIptcState_searchIndex"
    t.index ["value"], name: "index_AgInternedIptcState_value"
  end

  create_table "AgLastCatalogExport", primary_key: "image", force: :cascade do |t|
  end

  create_table "AgLibraryCollection", primary_key: "id_local", force: :cascade do |t|
    t.string        "creationId", default: "", null: false
    t.string        "genealogy",  default: "", null: false
    t.float        "imageCount"
    t.string     "name",       default: "", null: false
    t.integer "parent"
    t.float       "systemOnly", default: "", null: false
    t.index ["genealogy"], name: "index_AgLibraryCollection_genealogy"
    t.index ["parent", "name"], name: "index_AgLibraryCollection_parentAndName"
  end

  create_table "AgLibraryCollectionContent", primary_key: "id_local", force: :cascade do |t|
    t.integer "collection",   default: 0, null: false
    t.string     "content"
    t.string    "owningModule"
    t.index ["collection"], name: "index_AgLibraryCollectionContent_collection"
    t.index ["owningModule"], name: "index_AgLibraryCollectionContent_owningModule"
  end

  create_table "AgLibraryCollectionImage", primary_key: "id_local", force: :cascade do |t|
    t.integer "collection",           default: 0,   null: false
    t.integer "image",                default: 0,   null: false
    t.float   "pick",                 default: "0", null: false
    t.float   "positionInCollection"
    t.index ["collection"], name: "index_AgLibraryCollectionImage_collection"
    t.index ["image", "collection"], name: "index_AgLibraryCollectionImage_imageCollection"
  end

  create_table "AgLibraryCollectionStack", primary_key: "id_local", force: :cascade do |t|
    t.string    "id_global",               null: false
    t.integer "collapsed",  default: 0,  null: false
    t.integer "collection", default: 0,  null: false
    t.string    "text",       default: "", null: false
    t.index ["collection", "collapsed"], name: "index_AgLibraryCollectionStack_stacksForCollection"
    t.index ["id_global"], name: "sqlite_autoindex_AgLibraryCollectionStack_1", unique: true
  end

  create_table "AgLibraryCollectionStackData", id: false, force: :cascade do |t|
    t.integer "stack"
    t.integer "collection",  default: 0, null: false
    t.integer "stackCount",  default: 0, null: false
    t.integer "stackParent"
    t.index ["stack", "collection", "stackCount", "stackParent"], name: "index_AgLibraryCollectionStackData"
  end

  create_table "AgLibraryCollectionStackImage", primary_key: "id_local", force: :cascade do |t|
    t.integer "collapsed",  default: 0,  null: false
    t.integer "collection", default: 0,  null: false
    t.integer "image",      default: 0,  null: false
    t.string        "position",   default: "", null: false
    t.integer "stack",      default: 0,  null: false
    t.index ["collection", "collapsed", "stack", "position", "image"], name: "index_AgLibraryCollectionStackImage_orderByCollapseThenStackThenPosition"
    t.index ["collection", "image", "stack", "position", "collapsed"], name: "index_AgLibraryCollectionStackImage_getStackFromImage"
    t.index ["collection", "position", "stack", "image", "collapsed"], name: "index_AgLibraryCollectionStackImage_orderByPositionThenStack"
    t.index ["collection", "stack", "position", "image", "collapsed"], name: "index_AgLibraryCollectionStackImage_orderByStackThenPosition"
    t.index ["image"], name: "index_AgLibraryCollectionStackImage_image"
    t.index ["stack"], name: "index_AgLibraryCollectionStackImage_stack"
  end

  create_table "AgLibraryFile", primary_key: "id_local", force: :cascade do |t|
    t.string      "id_global",                             null: false
    t.string        "baseName",                 default: "", null: false
    t.string        "errorMessage"
    t.string        "errorTime"
    t.string  "extension",                default: "", null: false
    t.float        "externalModTime"
    t.integer "folder",                   default: 0,  null: false
    t.string        "idx_filename",             default: "", null: false
    t.string        "importHash"
    t.string        "lc_idx_filename",          default: "", null: false
    t.string        "lc_idx_filenameExtension", default: "", null: false
    t.string        "md5"
    t.float        "modTime"
    t.string        "originalFilename",         default: "", null: false
    t.string        "sidecarExtensions"
    t.index ["folder"], name: "index_AgLibraryFile_folder"
    t.index ["id_global"], name: "sqlite_autoindex_AgLibraryFile_1", unique: true
    t.index ["importHash"], name: "index_AgLibraryFile_importHash"
    t.index ["lc_idx_filename", "folder"], name: "index_AgLibraryFile_nameAndFolder", unique: true
  end

  create_table "AgLibraryFolder", primary_key: "id_local", force: :cascade do |t|
    t.string        "id_global",                 null: false
    t.string        "pathFromRoot", default: "", null: false
    t.integer "rootFolder",   default: 0,  null: false
    t.index ["id_global"], name: "sqlite_autoindex_AgLibraryFolder_1", unique: true
    t.index ["rootFolder", "pathFromRoot"], name: "index_AgLibraryFolder_rootFolderAndPath", unique: true
  end

  create_table "AgLibraryFolderStack", primary_key: "id_local", force: :cascade do |t|
    t.string        "id_global",              null: false
    t.integer "collapsed", default: 0,  null: false
    t.string        "text",      default: "", null: false
    t.index ["collapsed"], name: "index_AgLibraryFolderStack_collapsed"
    t.index ["id_global"], name: "sqlite_autoindex_AgLibraryFolderStack_1", unique: true
  end

  create_table "AgLibraryFolderStackData", id: false, force: :cascade do |t|
    t.integer "stack"
    t.integer "stackCount",  default: 0, null: false
    t.integer "stackParent"
    t.index ["stack", "stackCount", "stackParent"], name: "index_AgLibraryFolderStackData"
  end

  create_table "AgLibraryFolderStackImage", primary_key: "id_local", force: :cascade do |t|
    t.integer "collapsed", default: 0,  null: false
    t.integer "image",     default: 0,  null: false
    t.float        "position",  default: "", null: false
    t.integer "stack",     default: 0,  null: false
    t.index ["collapsed", "stack", "position", "image"], name: "index_AgLibraryFolderStackImage_orderByCollapseThenStackThenPosition"
    t.index ["image", "stack", "position", "collapsed"], name: "index_AgLibraryFolderStackImage_getStackFromImage"
    t.index ["position", "stack", "image", "collapsed"], name: "index_AgLibraryFolderStackImage_orderByPositionThenStack"
    t.index ["stack", "position", "image", "collapsed"], name: "index_AgLibraryFolderStackImage_orderByStackThenPosition"
  end

  create_table "AgLibraryIPTC", primary_key: "id_local", force: :cascade do |t|
    t.string        "caption"
    t.string        "copyright"
    t.integer "image",     default: 0, null: false
    t.index ["image"], name: "index_AgLibraryIPTC_image"
  end

  create_table "AgLibraryImageXMPUpdater", primary_key: "id_local", force: :cascade do |t|
    t.string "taskID",     default: "",        null: false
    t.string "taskStatus", default: "pending", null: false
    t.string "whenPosted", default: "",        null: false
    t.index ["taskID", "whenPosted", "taskStatus"], name: "index_AgLibraryImageXMPUpdater_taskIDCluster"
    t.index ["taskID"], name: "sqlite_autoindex_AgLibraryImageXMPUpdater_1", unique: true
    t.index ["taskStatus", "whenPosted", "taskID"], name: "index_AgLibraryImageXMPUpdater_statusCluster"
  end

  create_table "AgLibraryImport", primary_key: "id_local", force: :cascade do |t|
    t.float "imageCount"
    t.string "importDate", default: "", null: false
    t.string "name"
  end

  create_table "AgLibraryImportImage", primary_key: "id_local", force: :cascade do |t|
    t.integer "image",  default: 0, null: false
    t.integer "import", default: 0, null: false
    t.index ["image", "import"], name: "index_AgLibraryImportImage_imageAndImport", unique: true
    t.index ["import"], name: "index_AgLibraryImportImage_import"
  end

  create_table "AgLibraryKeyword", primary_key: "id_local", force: :cascade do |t|
    t.string        "id_global",                      null: false
    t.float        "dateCreated",     default: "",   null: false
    t.string        "genealogy",       default: "",   null: false
    t.float        "imageCountCache", default: "-1"
    t.integer "includeOnExport", default: 1,    null: false
    t.integer "includeParents",  default: 1,    null: false
    t.integer "includeSynonyms", default: 1,    null: false
    t.float        "lastApplied"
    t.string        "lc_name"
    t.string        "name"
    t.integer "parent"
    t.index ["genealogy"], name: "index_AgLibraryKeyword_genealogy"
    t.index ["id_global"], name: "sqlite_autoindex_AgLibraryKeyword_1", unique: true
    t.index ["parent", "lc_name"], name: "index_AgLibraryKeyword_parentAndLcName"
  end

  create_table "AgLibraryKeywordCooccurrence", primary_key: "id_local", force: :cascade do |t|
    t.float "tag1",  default: "",  null: false
    t.float "tag2",  default: "",  null: false
    t.float "value", default: "0", null: false
    t.index ["tag1", "tag2"], name: "index_AgLibraryKeywordCooccurrence_tagsLookup"
    t.index ["tag1", "value", "tag2"], name: "index_AgLibraryKeywordCooccurrence_tag1Search"
    t.index ["value"], name: "index_AgLibraryKeywordCooccurrence_valueIndex"
  end

  create_table "AgLibraryKeywordImage", primary_key: "id_local", force: :cascade do |t|
    t.integer "image", default: 0, null: false
    t.integer "tag",   default: 0, null: false
    t.index ["image"], name: "index_AgLibraryKeywordImage_image"
    t.index ["tag"], name: "index_AgLibraryKeywordImage_tag"
  end

  create_table "AgLibraryKeywordPopularity", primary_key: "id_local", force: :cascade do |t|
    t.float "occurrences", default: "0", null: false
    t.float "popularity",  default: "0", null: false
    t.float "tag",         default: "",  null: false
    t.index ["popularity"], name: "index_AgLibraryKeywordPopularity_popularity"
    t.index ["tag"], name: "sqlite_autoindex_AgLibraryKeywordPopularity_1", unique: true
  end

  create_table "AgLibraryKeywordSynonym", primary_key: "id_local", force: :cascade do |t|
    t.integer "keyword", default: 0, null: false
    t.float        "lc_name"
    t.float        "name"
    t.index ["keyword"], name: "index_AgLibraryKeywordSynonym_keyword"
    t.index ["lc_name"], name: "index_AgLibraryKeywordSynonym_lc_name"
  end

  create_table "AgLibraryPublishedCollection", primary_key: "id_local", force: :cascade do |t|
    t.string        "creationId",          default: "", null: false
    t.string        "genealogy",           default: "", null: false
    t.float        "imageCount"
    t.string        "isDefaultCollection"
    t.string        "name",                default: "", null: false
    t.integer "parent"
    t.string        "publishedUrl"
    t.string        "remoteCollectionId"
    t.string        "systemOnly",          default: "", null: false
    t.index ["genealogy"], name: "index_AgLibraryPublishedCollection_genealogy"
    t.index ["parent", "name"], name: "index_AgLibraryPublishedCollection_parentAndName"
  end

  create_table "AgLibraryPublishedCollectionContent", primary_key: "id_local", force: :cascade do |t|
    t.integer "collection",   default: 0, null: false
    t.string        "content"
    t.string        "owningModule"
    t.index ["collection"], name: "index_AgLibraryPublishedCollectionContent_collection"
    t.index ["owningModule"], name: "index_AgLibraryPublishedCollectionContent_owningModule"
  end

  create_table "AgLibraryPublishedCollectionImage", primary_key: "id_local", force: :cascade do |t|
    t.integer "collection",           default: 0,   null: false
    t.integer "image",                default: 0,   null: false
    t.string        "pick",                 default: "0", null: false
    t.string        "positionInCollection"
    t.index ["collection"], name: "index_AgLibraryPublishedCollectionImage_collection"
    t.index ["image", "collection"], name: "index_AgLibraryPublishedCollectionImage_imageCollection"
  end

  create_table "AgLibraryRootFolder", primary_key: "id_local", force: :cascade do |t|
    t.string "id_global",                            null: false
    t.string "absolutePath",            default: "", null: false
    t.string "name",                    default: "", null: false
    t.string "relativePathFromCatalog"
    t.index ["absolutePath"], name: "sqlite_autoindex_AgLibraryRootFolder_2", unique: true
    t.index ["id_global"], name: "sqlite_autoindex_AgLibraryRootFolder_1", unique: true
  end

  create_table "AgLibraryUpdatedImages", primary_key: "image", force: :cascade do |t|
  end

  create_table "AgMRULists", primary_key: "id_local", force: :cascade do |t|
    t.string "listID",    default: "",  null: false
    t.string "timestamp", default: "0", null: false
    t.string "value",     default: "",  null: false
    t.index ["listID"], name: "index_AgMRULists_listID"
  end

  create_table "AgMetadataSearchIndex", primary_key: "id_local", force: :cascade do |t|
    t.string        "exifSearchIndex",  default: "", null: false
    t.integer "image"
    t.string        "iptcSearchIndex",  default: "", null: false
    t.string        "otherSearchIndex", default: "", null: false
    t.string        "searchIndex",      default: "", null: false
    t.index ["image"], name: "index_AgMetadataSearchIndex_image"
  end

  create_table "AgOutputImageAsset", primary_key: "id_local", force: :cascade do |t|
    t.string        "assetId",    default: "", null: false
    t.integer "collection", default: 0,  null: false
    t.integer "image",      default: 0,  null: false
    t.string        "moduleId",   default: "", null: false
    t.index ["collection", "image", "moduleId", "assetId"], name: "index_AgOutputImageAsset_findByCollectionImage"
    t.index ["image"], name: "index_AgOutputImageAsset_image"
    t.index ["moduleId", "collection", "image", "assetId"], name: "index_AgOutputImageAsset_findByCollectionGroupByImage"
  end

  create_table "AgPhotoComment", primary_key: "id_local", force: :cascade do |t|
    t.string        "id_global",                    null: false
    t.string        "comment"
    t.string        "commentRealname"
    t.string        "commentUsername"
    t.string        "dateCreated"
    t.integer "photo",           default: 0,  null: false
    t.string        "remoteId",        default: "", null: false
    t.integer "remotePhoto"
    t.string        "url"
    t.index ["id_global"], name: "sqlite_autoindex_AgPhotoComment_1", unique: true
    t.index ["photo"], name: "index_AgPhotoComment_photo"
    t.index ["remoteId"], name: "index_AgPhotoComment_remoteId"
    t.index ["remotePhoto"], name: "index_AgPhotoComment_remotePhoto"
  end

  create_table "AgPhotoProperty", primary_key: "id_local", force: :cascade do |t|
    t.string        "id_global",                 null: false
    t.string        "dataType"
    t.string        "internalValue"
    t.integer "photo",         default: 0, null: false
    t.integer "propertySpec",  default: 0, null: false
    t.index ["id_global"], name: "sqlite_autoindex_AgPhotoProperty_1", unique: true
    t.index ["photo", "propertySpec"], name: "index_AgPhotoProperty_pluginKey", unique: true
    t.index ["propertySpec"], name: "index_AgPhotoProperty_propertySpec"
  end

  create_table "AgPhotoPropertyArrayElement", primary_key: "id_local", force: :cascade do |t|
    t.string        "id_global",                  null: false
    t.string        "arrayIndex",    default: "", null: false
    t.string        "dataType"
    t.string        "internalValue"
    t.integer "photo",         default: 0,  null: false
    t.integer "propertySpec",  default: 0,  null: false
    t.index ["id_global"], name: "sqlite_autoindex_AgPhotoPropertyArrayElement_1", unique: true
    t.index ["photo", "propertySpec", "arrayIndex"], name: "index_AgPhotoPropertyArrayElement_pluginKey", unique: true
    t.index ["propertySpec"], name: "index_AgPhotoPropertyArrayElement_propertySpec"
  end

  create_table "AgPhotoPropertySpec", primary_key: "id_local", force: :cascade do |t|
    t.string "id_global",                        null: false
    t.string "flattenedAttributes"
    t.string "key",                 default: "", null: false
    t.float "pluginVersion",       default: "", null: false
    t.string "sourcePlugin",        default: "", null: false
    t.string "userVisibleName"
    t.index ["id_global"], name: "sqlite_autoindex_AgPhotoPropertySpec_1", unique: true
    t.index ["sourcePlugin", "key", "pluginVersion"], name: "index_AgPhotoPropertySpec_pluginKey", unique: true
  end

  create_table "AgPublishListenerWorklist", primary_key: "id_local", force: :cascade do |t|
    t.string "taskID",     default: "",        null: false
    t.string "taskStatus", default: "pending", null: false
    t.string "whenPosted", default: "",        null: false
    t.index ["taskID", "whenPosted", "taskStatus"], name: "index_AgPublishListenerWorklist_taskIDCluster"
    t.index ["taskID"], name: "sqlite_autoindex_AgPublishListenerWorklist_1", unique: true
    t.index ["taskStatus", "whenPosted", "taskID"], name: "index_AgPublishListenerWorklist_statusCluster"
  end

  create_table "AgRemotePhoto", primary_key: "id_local", force: :cascade do |t|
    t.string        "id_global",                            null: false
    t.integer "collection",             default: 0,   null: false
    t.float        "commentCount"
    t.string        "developSettingsDigest"
    t.string        "fileContentsHash"
    t.string        "fileModTimestamp"
    t.string        "metadataDigest"
    t.string        "mostRecentCommentTime"
    t.string        "orientation"
    t.integer "photo",                  default: 0,   null: false
    t.string        "photoNeedsUpdating",     default: "2"
    t.string        "publishCount"
    t.string        "remoteId"
    t.string        "serviceAggregateRating"
    t.string        "url"
    t.index ["collection", "photo"], name: "index_AgRemotePhoto_collectionPhoto", unique: true
    t.index ["collection", "photoNeedsUpdating"], name: "index_AgRemotePhoto_collectionNeedsUpdating"
    t.index ["collection", "remoteId"], name: "index_AgRemotePhoto_collectionRemoteId", unique: true
    t.index ["id_global"], name: "sqlite_autoindex_AgRemotePhoto_1", unique: true
    t.index ["photo"], name: "index_AgRemotePhoto_photo"
  end

  create_table "AgSearchablePhotoProperty", primary_key: "id_local", force: :cascade do |t|
    t.string        "id_global",                        null: false
    t.string        "dataType"
    t.string        "internalValue"
    t.string        "lc_idx_internalValue"
    t.integer "photo",                default: 0, null: false
    t.integer "propertySpec",         default: 0, null: false
    t.index ["id_global"], name: "sqlite_autoindex_AgSearchablePhotoProperty_1", unique: true
    t.index ["lc_idx_internalValue"], name: "index_AgSearchablePhotoProperty_lc_idx_internalValue"
    t.index ["photo", "propertySpec"], name: "index_AgSearchablePhotoProperty_pluginKey", unique: true
    t.index ["propertySpec", "internalValue"], name: "index_AgSearchablePhotoProperty_propertyValue"
    t.index ["propertySpec", "lc_idx_internalValue"], name: "index_AgSearchablePhotoProperty_propertyValue_lc"
  end

  create_table "AgSearchablePhotoPropertyArrayElement", primary_key: "id_local", force: :cascade do |t|
    t.string        "id_global",                         null: false
    t.string        "arrayIndex",           default: "", null: false
    t.string        "dataType"
    t.string        "internalValue"
    t.string        "lc_idx_internalValue"
    t.integer "photo",                default: 0,  null: false
    t.integer "propertySpec",         default: 0,  null: false
    t.index ["id_global"], name: "sqlite_autoindex_AgSearchablePhotoPropertyArrayElement_1", unique: true
    t.index ["lc_idx_internalValue"], name: "index_AgSearchablePhotoPropertyArrayElement_lc_idx_internalValue"
    t.index ["photo", "propertySpec", "arrayIndex"], name: "index_AgSearchablePhotoPropertyArrayElement_pluginKey", unique: true
    t.index ["propertySpec", "internalValue"], name: "index_AgSearchablePhotoPropertyArrayElement_propertyValue"
    t.index ["propertySpec", "lc_idx_internalValue"], name: "index_AgSearchablePhotoPropertyArrayElement_propertyValue_lc"
  end

  create_table "AgSpecialSourceContent", primary_key: "id_local", force: :cascade do |t|
    t.string "content"
    t.string "owningModule"
    t.string "source",       default: "", null: false
    t.index ["owningModule"], name: "index_AgSpecialSourceContent_owningModule"
    t.index ["source", "owningModule"], name: "index_AgSpecialSourceContent_sourceModule", unique: true
  end

  create_table "AgTempImages", primary_key: "image", force: :cascade do |t|
  end

  create_table "AgVideoInfo", primary_key: "id_local", force: :cascade do |t|
    t.string        "duration"
    t.string        "frame_rate"
    t.integer "has_audio",                default: 1,                                   null: false
    t.integer "has_video",                default: 1,                                   null: false
    t.integer "image",                    default: 0,                                   null: false
    t.string        "poster_frame",             default: "0000000000000000/0000000000000001", null: false
    t.integer "poster_frame_set_by_user", default: 0,                                   null: false
    t.string        "trim_end",                 default: "0000000000000000/0000000000000001", null: false
    t.string        "trim_start",               default: "0000000000000000/0000000000000001", null: false
    t.index ["image"], name: "index_AgVideoInfo_image"
  end

  create_table "sqlite_stat1", id: false, force: :cascade do |t|
    t.string "tbl"
    t.string "idx"
    t.string "stat"
  end

end
