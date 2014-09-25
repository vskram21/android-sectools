.class public abstract Lorg/eclipse/jgit/lib/TreeEntry;
.super Ljava/lang/Object;
.source "TreeEntry.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private id:Lorg/eclipse/jgit/lib/ObjectId;

.field private nameUTF8:[B

.field private parent:Lorg/eclipse/jgit/lib/Tree;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Tree;Lorg/eclipse/jgit/lib/ObjectId;[B)V
    .locals 0
    .parameter "myParent"
    .parameter "myId"
    .parameter "myNameUTF8"

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    iput-object p3, p0, Lorg/eclipse/jgit/lib/TreeEntry;->nameUTF8:[B

    .line 78
    iput-object p1, p0, Lorg/eclipse/jgit/lib/TreeEntry;->parent:Lorg/eclipse/jgit/lib/Tree;

    .line 79
    iput-object p2, p0, Lorg/eclipse/jgit/lib/TreeEntry;->id:Lorg/eclipse/jgit/lib/ObjectId;

    .line 80
    return-void
.end method

.method private appendFullName(Ljava/lang/StringBuilder;)V
    .locals 3
    .parameter "r"

    .prologue
    .line 244
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/TreeEntry;->getParent()Lorg/eclipse/jgit/lib/Tree;

    move-result-object v1

    .line 245
    .local v1, p:Lorg/eclipse/jgit/lib/TreeEntry;
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/TreeEntry;->getName()Ljava/lang/String;

    move-result-object v0

    .line 246
    .local v0, n:Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 247
    invoke-direct {v1, p1}, Lorg/eclipse/jgit/lib/TreeEntry;->appendFullName(Ljava/lang/StringBuilder;)V

    .line 248
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 249
    const/16 v2, 0x2f

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 252
    :cond_0
    if-eqz v0, :cond_1

    .line 253
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    :cond_1
    return-void
.end method

.method public static final lastChar(Lorg/eclipse/jgit/lib/TreeEntry;)I
    .locals 1
    .parameter "treeEntry"

    .prologue
    .line 232
    instance-of v0, p0, Lorg/eclipse/jgit/lib/Tree;

    if-nez v0, :cond_0

    .line 233
    const/4 v0, 0x0

    .line 235
    :goto_0
    return v0

    :cond_0
    const/16 v0, 0x2f

    goto :goto_0
.end method


# virtual methods
.method attachParent(Lorg/eclipse/jgit/lib/Tree;)V
    .locals 0
    .parameter "p"

    .prologue
    .line 105
    iput-object p1, p0, Lorg/eclipse/jgit/lib/TreeEntry;->parent:Lorg/eclipse/jgit/lib/Tree;

    .line 106
    return-void
.end method

.method public compareTo(Ljava/lang/Object;)I
    .locals 4
    .parameter "o"

    .prologue
    .line 218
    if-ne p0, p1, :cond_0

    .line 219
    const/4 v0, 0x0

    .line 222
    .end local p1
    :goto_0
    return v0

    .line 220
    .restart local p1
    :cond_0
    instance-of v0, p1, Lorg/eclipse/jgit/lib/TreeEntry;

    if-eqz v0, :cond_1

    .line 221
    iget-object v1, p0, Lorg/eclipse/jgit/lib/TreeEntry;->nameUTF8:[B

    move-object v0, p1

    check-cast v0, Lorg/eclipse/jgit/lib/TreeEntry;

    iget-object v0, v0, Lorg/eclipse/jgit/lib/TreeEntry;->nameUTF8:[B

    invoke-static {p0}, Lorg/eclipse/jgit/lib/TreeEntry;->lastChar(Lorg/eclipse/jgit/lib/TreeEntry;)I

    move-result v2

    check-cast p1, Lorg/eclipse/jgit/lib/TreeEntry;

    .end local p1
    invoke-static {p1}, Lorg/eclipse/jgit/lib/TreeEntry;->lastChar(Lorg/eclipse/jgit/lib/TreeEntry;)I

    move-result v3

    invoke-static {v1, v0, v2, v3}, Lorg/eclipse/jgit/lib/Tree;->compareNames([B[BII)I

    move-result v0

    goto :goto_0

    .line 222
    .restart local p1
    :cond_1
    const/4 v0, -0x1

    goto :goto_0
.end method

.method public delete()V
    .locals 1

    .prologue
    .line 93
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/TreeEntry;->getParent()Lorg/eclipse/jgit/lib/Tree;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/eclipse/jgit/lib/Tree;->removeEntry(Lorg/eclipse/jgit/lib/TreeEntry;)V

    .line 94
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/TreeEntry;->detachParent()V

    .line 95
    return-void
.end method

.method public detachParent()V
    .locals 1

    .prologue
    .line 101
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/TreeEntry;->parent:Lorg/eclipse/jgit/lib/Tree;

    .line 102
    return-void
.end method

.method public getFullName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 204
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 205
    .local v0, r:Ljava/lang/StringBuilder;
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/lib/TreeEntry;->appendFullName(Ljava/lang/StringBuilder;)V

    .line 206
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getFullNameUTF8()[B
    .locals 1

    .prologue
    .line 214
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/TreeEntry;->getFullName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    return-object v0
.end method

.method public getId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 176
    iget-object v0, p0, Lorg/eclipse/jgit/lib/TreeEntry;->id:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method public abstract getMode()Lorg/eclipse/jgit/lib/FileMode;
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 126
    iget-object v0, p0, Lorg/eclipse/jgit/lib/TreeEntry;->nameUTF8:[B

    if-eqz v0, :cond_0

    .line 127
    iget-object v0, p0, Lorg/eclipse/jgit/lib/TreeEntry;->nameUTF8:[B

    invoke-static {v0}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([B)Ljava/lang/String;

    move-result-object v0

    .line 128
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getNameUTF8()[B
    .locals 1

    .prologue
    .line 119
    iget-object v0, p0, Lorg/eclipse/jgit/lib/TreeEntry;->nameUTF8:[B

    return-object v0
.end method

.method public getParent()Lorg/eclipse/jgit/lib/Tree;
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lorg/eclipse/jgit/lib/TreeEntry;->parent:Lorg/eclipse/jgit/lib/Tree;

    return-object v0
.end method

.method public getRepository()Lorg/eclipse/jgit/lib/Repository;
    .locals 1

    .prologue
    .line 112
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/TreeEntry;->getParent()Lorg/eclipse/jgit/lib/Tree;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/Tree;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v0

    return-object v0
.end method

.method public isModified()Z
    .locals 1

    .prologue
    .line 162
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/TreeEntry;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public rename(Ljava/lang/String;)V
    .locals 1
    .parameter "n"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 138
    invoke-static {p1}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/lib/TreeEntry;->rename([B)V

    .line 139
    return-void
.end method

.method public rename([B)V
    .locals 1
    .parameter "n"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 148
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/TreeEntry;->getParent()Lorg/eclipse/jgit/lib/Tree;

    move-result-object v0

    .line 149
    .local v0, t:Lorg/eclipse/jgit/lib/Tree;
    if-eqz v0, :cond_0

    .line 150
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/TreeEntry;->delete()V

    .line 152
    :cond_0
    iput-object p1, p0, Lorg/eclipse/jgit/lib/TreeEntry;->nameUTF8:[B

    .line 153
    if-eqz v0, :cond_1

    .line 154
    invoke-virtual {v0, p0}, Lorg/eclipse/jgit/lib/Tree;->addEntry(Lorg/eclipse/jgit/lib/TreeEntry;)V

    .line 156
    :cond_1
    return-void
.end method

.method public setId(Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 2
    .parameter "n"

    .prologue
    .line 189
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/TreeEntry;->getParent()Lorg/eclipse/jgit/lib/Tree;

    move-result-object v0

    .line 190
    .local v0, p:Lorg/eclipse/jgit/lib/Tree;
    if-eqz v0, :cond_3

    iget-object v1, p0, Lorg/eclipse/jgit/lib/TreeEntry;->id:Lorg/eclipse/jgit/lib/ObjectId;

    if-eq v1, p1, :cond_3

    .line 191
    iget-object v1, p0, Lorg/eclipse/jgit/lib/TreeEntry;->id:Lorg/eclipse/jgit/lib/ObjectId;

    if-nez v1, :cond_0

    if-nez p1, :cond_2

    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/lib/TreeEntry;->id:Lorg/eclipse/jgit/lib/ObjectId;

    if-eqz v1, :cond_1

    if-eqz p1, :cond_2

    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/lib/TreeEntry;->id:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 193
    :cond_2
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/Tree;->setId(Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 197
    :cond_3
    iput-object p1, p0, Lorg/eclipse/jgit/lib/TreeEntry;->id:Lorg/eclipse/jgit/lib/ObjectId;

    .line 198
    return-void
.end method

.method public setModified()V
    .locals 1

    .prologue
    .line 169
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/lib/TreeEntry;->setId(Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 170
    return-void
.end method
