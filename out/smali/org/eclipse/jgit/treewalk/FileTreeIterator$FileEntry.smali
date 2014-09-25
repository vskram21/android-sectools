.class public Lorg/eclipse/jgit/treewalk/FileTreeIterator$FileEntry;
.super Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;
.source "FileTreeIterator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/treewalk/FileTreeIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FileEntry"
.end annotation


# instance fields
.field private attributes:Lorg/eclipse/jgit/util/FS$Attributes;

.field private fs:Lorg/eclipse/jgit/util/FS;

.field private final mode:Lorg/eclipse/jgit/lib/FileMode;


# direct methods
.method public constructor <init>(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V
    .locals 2
    .parameter "f"
    .parameter "fs"

    .prologue
    .line 166
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;-><init>()V

    .line 167
    iput-object p2, p0, Lorg/eclipse/jgit/treewalk/FileTreeIterator$FileEntry;->fs:Lorg/eclipse/jgit/util/FS;

    .line 168
    invoke-virtual {p2, p1}, Lorg/eclipse/jgit/util/FS;->normalize(Ljava/io/File;)Ljava/io/File;

    move-result-object p1

    .line 169
    invoke-virtual {p2, p1}, Lorg/eclipse/jgit/util/FS;->getAttributes(Ljava/io/File;)Lorg/eclipse/jgit/util/FS$Attributes;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/FileTreeIterator$FileEntry;->attributes:Lorg/eclipse/jgit/util/FS$Attributes;

    .line 170
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/FileTreeIterator$FileEntry;->attributes:Lorg/eclipse/jgit/util/FS$Attributes;

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/FS$Attributes;->isSymbolicLink()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 171
    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->SYMLINK:Lorg/eclipse/jgit/lib/FileMode;

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/FileTreeIterator$FileEntry;->mode:Lorg/eclipse/jgit/lib/FileMode;

    .line 181
    :goto_0
    return-void

    .line 172
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/FileTreeIterator$FileEntry;->attributes:Lorg/eclipse/jgit/util/FS$Attributes;

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/FS$Attributes;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 173
    new-instance v0, Ljava/io/File;

    const-string v1, ".git"

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 174
    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->GITLINK:Lorg/eclipse/jgit/lib/FileMode;

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/FileTreeIterator$FileEntry;->mode:Lorg/eclipse/jgit/lib/FileMode;

    goto :goto_0

    .line 176
    :cond_1
    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/FileTreeIterator$FileEntry;->mode:Lorg/eclipse/jgit/lib/FileMode;

    goto :goto_0

    .line 177
    :cond_2
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/FileTreeIterator$FileEntry;->attributes:Lorg/eclipse/jgit/util/FS$Attributes;

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/FS$Attributes;->isExecutable()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 178
    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->EXECUTABLE_FILE:Lorg/eclipse/jgit/lib/FileMode;

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/FileTreeIterator$FileEntry;->mode:Lorg/eclipse/jgit/lib/FileMode;

    goto :goto_0

    .line 180
    :cond_3
    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->REGULAR_FILE:Lorg/eclipse/jgit/lib/FileMode;

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/FileTreeIterator$FileEntry;->mode:Lorg/eclipse/jgit/lib/FileMode;

    goto :goto_0
.end method


# virtual methods
.method public getFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 219
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/FileTreeIterator$FileEntry;->attributes:Lorg/eclipse/jgit/util/FS$Attributes;

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/FS$Attributes;->getFile()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public getLastModified()J
    .locals 2

    .prologue
    .line 200
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/FileTreeIterator$FileEntry;->attributes:Lorg/eclipse/jgit/util/FS$Attributes;

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/FS$Attributes;->getLastModifiedTime()J

    move-result-wide v0

    return-wide v0
.end method

.method public getLength()J
    .locals 2

    .prologue
    .line 195
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/FileTreeIterator$FileEntry;->attributes:Lorg/eclipse/jgit/util/FS$Attributes;

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/FS$Attributes;->getLength()J

    move-result-wide v0

    return-wide v0
.end method

.method public getMode()Lorg/eclipse/jgit/lib/FileMode;
    .locals 1

    .prologue
    .line 185
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/FileTreeIterator$FileEntry;->mode:Lorg/eclipse/jgit/lib/FileMode;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 190
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/FileTreeIterator$FileEntry;->attributes:Lorg/eclipse/jgit/util/FS$Attributes;

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/FS$Attributes;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public openInputStream()Ljava/io/InputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 205
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/FileTreeIterator$FileEntry;->fs:Lorg/eclipse/jgit/util/FS;

    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/FileTreeIterator$FileEntry;->getFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/util/FS;->isSymLink(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 206
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/FileTreeIterator$FileEntry;->fs:Lorg/eclipse/jgit/util/FS;

    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/FileTreeIterator$FileEntry;->getFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/util/FS;->readSymLink(Ljava/io/File;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "UTF-8"

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 210
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/io/FileInputStream;

    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/FileTreeIterator$FileEntry;->getFile()Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    goto :goto_0
.end method

.method public bridge synthetic toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 151
    invoke-super {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
