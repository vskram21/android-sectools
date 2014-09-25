.class public Lorg/eclipse/jgit/treewalk/FileTreeIterator;
.super Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
.source "FileTreeIterator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/treewalk/FileTreeIterator$FileEntry;
    }
.end annotation


# instance fields
.field protected final directory:Ljava/io/File;

.field protected final fs:Lorg/eclipse/jgit/util/FS;


# direct methods
.method public constructor <init>(Ljava/io/File;Lorg/eclipse/jgit/util/FS;Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;)V
    .locals 1
    .parameter "root"
    .parameter "fs"
    .parameter "options"

    .prologue
    .line 106
    invoke-direct {p0, p3}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;-><init>(Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;)V

    .line 107
    iput-object p1, p0, Lorg/eclipse/jgit/treewalk/FileTreeIterator;->directory:Ljava/io/File;

    .line 108
    iput-object p2, p0, Lorg/eclipse/jgit/treewalk/FileTreeIterator;->fs:Lorg/eclipse/jgit/util/FS;

    .line 109
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;->entries()[Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;->init([Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;)V

    .line 110
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 4
    .parameter "repo"

    .prologue
    .line 88
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v1

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v2

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v0

    sget-object v3, Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;->KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;

    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/lib/StoredConfig;->get(Lorg/eclipse/jgit/lib/Config$SectionParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;

    invoke-direct {p0, v1, v2, v0}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;-><init>(Ljava/io/File;Lorg/eclipse/jgit/util/FS;Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;)V

    .line 90
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;->initRootIterator(Lorg/eclipse/jgit/lib/Repository;)V

    .line 91
    return-void
.end method

.method protected constructor <init>(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V
    .locals 1
    .parameter "p"
    .parameter "root"
    .parameter "fs"

    .prologue
    .line 126
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;-><init>(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;)V

    .line 127
    iput-object p2, p0, Lorg/eclipse/jgit/treewalk/FileTreeIterator;->directory:Ljava/io/File;

    .line 128
    iput-object p3, p0, Lorg/eclipse/jgit/treewalk/FileTreeIterator;->fs:Lorg/eclipse/jgit/util/FS;

    .line 129
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;->entries()[Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;->init([Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;)V

    .line 130
    return-void
.end method

.method private entries()[Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;
    .locals 6

    .prologue
    .line 139
    iget-object v3, p0, Lorg/eclipse/jgit/treewalk/FileTreeIterator;->directory:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 140
    .local v0, all:[Ljava/io/File;
    if-nez v0, :cond_1

    .line 141
    sget-object v2, Lorg/eclipse/jgit/treewalk/FileTreeIterator;->EOF:[Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;

    .line 145
    :cond_0
    return-object v2

    .line 142
    :cond_1
    array-length v3, v0

    new-array v2, v3, [Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;

    .line 143
    .local v2, r:[Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, v2

    if-ge v1, v3, :cond_0

    .line 144
    new-instance v3, Lorg/eclipse/jgit/treewalk/FileTreeIterator$FileEntry;

    aget-object v4, v0, v1

    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/FileTreeIterator;->fs:Lorg/eclipse/jgit/util/FS;

    invoke-direct {v3, v4, v5}, Lorg/eclipse/jgit/treewalk/FileTreeIterator$FileEntry;-><init>(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V

    aput-object v3, v2, v1

    .line 143
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method


# virtual methods
.method public createSubtreeIterator(Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .locals 3
    .parameter "reader"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 135
    new-instance v1, Lorg/eclipse/jgit/treewalk/FileTreeIterator;

    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;->current()Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/treewalk/FileTreeIterator$FileEntry;

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/FileTreeIterator$FileEntry;->getFile()Ljava/io/File;

    move-result-object v0

    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/FileTreeIterator;->fs:Lorg/eclipse/jgit/util/FS;

    invoke-direct {v1, p0, v0, v2}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;-><init>(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V

    return-object v1
.end method

.method public getDirectory()Ljava/io/File;
    .locals 1

    .prologue
    .line 227
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/FileTreeIterator;->directory:Ljava/io/File;

    return-object v0
.end method

.method public getEntryFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 236
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;->current()Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/treewalk/FileTreeIterator$FileEntry;

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/FileTreeIterator$FileEntry;->getFile()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method protected idSubmodule(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;)[B
    .locals 1
    .parameter "e"

    .prologue
    .line 241
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/FileTreeIterator;->repository:Lorg/eclipse/jgit/lib/Repository;

    if-nez v0, :cond_0

    .line 242
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;->getDirectory()Ljava/io/File;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;->idSubmodule(Ljava/io/File;Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;)[B

    move-result-object v0

    .line 243
    :goto_0
    return-object v0

    :cond_0
    invoke-super {p0, p1}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->idSubmodule(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;)[B

    move-result-object v0

    goto :goto_0
.end method
