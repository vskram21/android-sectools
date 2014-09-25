.class public Lorg/eclipse/jgit/lib/GitlinkTreeEntry;
.super Lorg/eclipse/jgit/lib/TreeEntry;
.source "GitlinkTreeEntry.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Tree;Lorg/eclipse/jgit/lib/ObjectId;[B)V
    .locals 0
    .parameter "parent"
    .parameter "id"
    .parameter "nameUTF8"

    .prologue
    .line 72
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/lib/TreeEntry;-><init>(Lorg/eclipse/jgit/lib/Tree;Lorg/eclipse/jgit/lib/ObjectId;[B)V

    .line 73
    return-void
.end method


# virtual methods
.method public getMode()Lorg/eclipse/jgit/lib/FileMode;
    .locals 1

    .prologue
    .line 76
    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->GITLINK:Lorg/eclipse/jgit/lib/FileMode;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 81
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 82
    .local v0, r:Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/GitlinkTreeEntry;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-static {v1}, Lorg/eclipse/jgit/lib/ObjectId;->toString(Lorg/eclipse/jgit/lib/ObjectId;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    const-string v1, " G "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/GitlinkTreeEntry;->getFullName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
