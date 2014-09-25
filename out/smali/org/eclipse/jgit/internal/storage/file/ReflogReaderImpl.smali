.class Lorg/eclipse/jgit/internal/storage/file/ReflogReaderImpl;
.super Ljava/lang/Object;
.source "ReflogReaderImpl.java"

# interfaces
.implements Lorg/eclipse/jgit/lib/ReflogReader;


# instance fields
.field private logName:Ljava/io/File;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;)V
    .locals 4
    .parameter "db"
    .parameter "refname"

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "logs/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ReflogReaderImpl;->logName:Ljava/io/File;

    .line 72
    return-void
.end method


# virtual methods
.method public getLastEntry()Lorg/eclipse/jgit/lib/ReflogEntry;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/ReflogReaderImpl;->getReverseEntry(I)Lorg/eclipse/jgit/lib/ReflogEntry;

    move-result-object v0

    return-object v0
.end method

.method public getReverseEntries()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/ReflogEntry;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 85
    const v0, 0x7fffffff

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/ReflogReaderImpl;->getReverseEntries(I)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getReverseEntries(I)Ljava/util/List;
    .locals 7
    .parameter "max"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/ReflogEntry;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 119
    :try_start_0
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/ReflogReaderImpl;->logName:Ljava/io/File;

    invoke-static {v6}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/File;)[B
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 124
    .local v2, log:[B
    array-length v6, v2

    invoke-static {v2, v6}, Lorg/eclipse/jgit/util/RawParseUtils;->prevLF([BI)I

    move-result v5

    .line 125
    .local v5, rs:I
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .local v4, ret:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ReflogEntry;>;"
    move v3, p1

    .line 126
    .end local p1
    .local v3, max:I
    :goto_0
    if-ltz v5, :cond_2

    add-int/lit8 p1, v3, -0x1

    .end local v3           #max:I
    .restart local p1
    if-lez v3, :cond_0

    .line 127
    invoke-static {v2, v5}, Lorg/eclipse/jgit/util/RawParseUtils;->prevLF([BI)I

    move-result v5

    .line 128
    new-instance v1, Lorg/eclipse/jgit/internal/storage/file/ReflogEntryImpl;

    if-gez v5, :cond_1

    const/4 v6, 0x0

    :goto_1
    invoke-direct {v1, v2, v6}, Lorg/eclipse/jgit/internal/storage/file/ReflogEntryImpl;-><init>([BI)V

    .line 129
    .local v1, entry:Lorg/eclipse/jgit/lib/ReflogEntry;
    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move v3, p1

    .line 130
    .end local p1
    .restart local v3       #max:I
    goto :goto_0

    .line 120
    .end local v1           #entry:Lorg/eclipse/jgit/lib/ReflogEntry;
    .end local v2           #log:[B
    .end local v3           #max:I
    .end local v4           #ret:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ReflogEntry;>;"
    .end local v5           #rs:I
    .restart local p1
    :catch_0
    move-exception v0

    .line 121
    .local v0, e:Ljava/io/FileNotFoundException;
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v4

    .line 131
    .end local v0           #e:Ljava/io/FileNotFoundException;
    :cond_0
    :goto_2
    return-object v4

    .line 128
    .restart local v2       #log:[B
    .restart local v4       #ret:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ReflogEntry;>;"
    .restart local v5       #rs:I
    :cond_1
    add-int/lit8 v6, v5, 0x2

    goto :goto_1

    .end local p1
    .restart local v3       #max:I
    :cond_2
    move p1, v3

    .end local v3           #max:I
    .restart local p1
    goto :goto_2
.end method

.method public getReverseEntry(I)Lorg/eclipse/jgit/lib/ReflogEntry;
    .locals 6
    .parameter "number"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 92
    if-gez p1, :cond_0

    .line 93
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-direct {v4}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v4

    .line 97
    :cond_0
    :try_start_0
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/ReflogReaderImpl;->logName:Ljava/io/File;

    invoke-static {v5}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/File;)[B
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 102
    .local v2, log:[B
    array-length v5, v2

    invoke-static {v2, v5}, Lorg/eclipse/jgit/util/RawParseUtils;->prevLF([BI)I

    move-result v3

    .line 103
    .local v3, rs:I
    const/4 v0, 0x0

    .line 104
    .local v0, current:I
    :goto_0
    if-ltz v3, :cond_1

    .line 105
    invoke-static {v2, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->prevLF([BI)I

    move-result v3

    .line 106
    if-ne p1, v0, :cond_3

    .line 107
    new-instance v5, Lorg/eclipse/jgit/internal/storage/file/ReflogEntryImpl;

    if-gez v3, :cond_2

    const/4 v4, 0x0

    :goto_1
    invoke-direct {v5, v2, v4}, Lorg/eclipse/jgit/internal/storage/file/ReflogEntryImpl;-><init>([BI)V

    move-object v4, v5

    .line 110
    .end local v0           #current:I
    .end local v2           #log:[B
    .end local v3           #rs:I
    :cond_1
    :goto_2
    return-object v4

    .line 98
    :catch_0
    move-exception v1

    .line 99
    .local v1, e:Ljava/io/FileNotFoundException;
    goto :goto_2

    .line 107
    .end local v1           #e:Ljava/io/FileNotFoundException;
    .restart local v0       #current:I
    .restart local v2       #log:[B
    .restart local v3       #rs:I
    :cond_2
    add-int/lit8 v4, v3, 0x2

    goto :goto_1

    .line 108
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method
