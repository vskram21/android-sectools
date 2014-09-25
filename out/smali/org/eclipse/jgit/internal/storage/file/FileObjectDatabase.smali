.class abstract Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;
.super Lorg/eclipse/jgit/lib/ObjectDatabase;
.source "FileObjectDatabase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 62
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/ObjectDatabase;-><init>()V

    .line 63
    return-void
.end method


# virtual methods
.method abstract fileFor(Lorg/eclipse/jgit/lib/AnyObjectId;)Ljava/io/File;
.end method

.method abstract getConfig()Lorg/eclipse/jgit/lib/Config;
.end method

.method abstract getDirectory()Ljava/io/File;
.end method

.method abstract getFS()Lorg/eclipse/jgit/util/FS;
.end method

.method abstract getObjectSize(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method abstract getPacks()Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/PackFile;",
            ">;"
        }
    .end annotation
.end method

.method abstract getShallowCommits()Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method abstract insertUnpackedObject(Ljava/io/File;Lorg/eclipse/jgit/lib/ObjectId;Z)Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public newInserter()Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;
    .locals 2

    .prologue
    .line 74
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;->getConfig()Lorg/eclipse/jgit/lib/Config;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;-><init>(Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;Lorg/eclipse/jgit/lib/Config;)V

    return-object v0
.end method

.method public bridge synthetic newInserter()Lorg/eclipse/jgit/lib/ObjectInserter;
    .locals 1

    .prologue
    .line 62
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;->newInserter()Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;

    move-result-object v0

    return-object v0
.end method

.method public newReader()Lorg/eclipse/jgit/lib/ObjectReader;
    .locals 1

    .prologue
    .line 69
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;-><init>(Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;)V

    return-object v0
.end method

.method abstract openLooseObject(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method abstract openObject(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method abstract openPack(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/file/PackFile;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method abstract resolve(Ljava/util/Set;Lorg/eclipse/jgit/lib/AbbreviatedObjectId;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;",
            "Lorg/eclipse/jgit/lib/AbbreviatedObjectId;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method abstract selectObjectRepresentation(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;Lorg/eclipse/jgit/internal/storage/file/WindowCursor;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
