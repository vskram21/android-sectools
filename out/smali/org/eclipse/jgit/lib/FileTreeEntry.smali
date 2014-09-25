.class public Lorg/eclipse/jgit/lib/FileTreeEntry;
.super Lorg/eclipse/jgit/lib/TreeEntry;
.source "FileTreeEntry.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private mode:Lorg/eclipse/jgit/lib/FileMode;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Tree;Lorg/eclipse/jgit/lib/ObjectId;[BZ)V
    .locals 0
    .parameter "parent"
    .parameter "id"
    .parameter "nameUTF8"
    .parameter "execute"

    .prologue
    .line 76
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/lib/TreeEntry;-><init>(Lorg/eclipse/jgit/lib/Tree;Lorg/eclipse/jgit/lib/ObjectId;[B)V

    .line 77
    invoke-virtual {p0, p4}, Lorg/eclipse/jgit/lib/FileTreeEntry;->setExecutable(Z)V

    .line 78
    return-void
.end method


# virtual methods
.method public getMode()Lorg/eclipse/jgit/lib/FileMode;
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lorg/eclipse/jgit/lib/FileTreeEntry;->mode:Lorg/eclipse/jgit/lib/FileMode;

    return-object v0
.end method

.method public isExecutable()Z
    .locals 2

    .prologue
    .line 88
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/FileTreeEntry;->getMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v0

    sget-object v1, Lorg/eclipse/jgit/lib/FileMode;->EXECUTABLE_FILE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public openReader()Lorg/eclipse/jgit/lib/ObjectLoader;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 103
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/FileTreeEntry;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/FileTreeEntry;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/lib/Repository;->open(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v0

    return-object v0
.end method

.method public setExecutable(Z)V
    .locals 1
    .parameter "execute"

    .prologue
    .line 95
    if-eqz p1, :cond_0

    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->EXECUTABLE_FILE:Lorg/eclipse/jgit/lib/FileMode;

    :goto_0
    iput-object v0, p0, Lorg/eclipse/jgit/lib/FileTreeEntry;->mode:Lorg/eclipse/jgit/lib/FileMode;

    .line 96
    return-void

    .line 95
    :cond_0
    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->REGULAR_FILE:Lorg/eclipse/jgit/lib/FileMode;

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    const/16 v2, 0x20

    .line 107
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 108
    .local v0, r:Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/FileTreeEntry;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-static {v1}, Lorg/eclipse/jgit/lib/ObjectId;->toString(Lorg/eclipse/jgit/lib/ObjectId;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 110
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/FileTreeEntry;->isExecutable()Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, 0x58

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 111
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 112
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/FileTreeEntry;->getFullName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 110
    :cond_0
    const/16 v1, 0x46

    goto :goto_0
.end method
