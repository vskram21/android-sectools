.class public abstract Lorg/eclipse/jgit/lib/RefWriter;
.super Ljava/lang/Object;
.source "RefWriter.java"


# instance fields
.field private final refs:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Collection;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 74
    .local p1, refs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    invoke-static {p1}, Lorg/eclipse/jgit/lib/RefComparator;->sort(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/RefWriter;->refs:Ljava/util/Collection;

    .line 76
    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 83
    .local p1, refs:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    instance-of v0, p1, Lorg/eclipse/jgit/util/RefMap;

    if-eqz v0, :cond_0

    .line 85
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/RefWriter;->refs:Ljava/util/Collection;

    .line 88
    :goto_0
    return-void

    .line 87
    :cond_0
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/RefComparator;->sort(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/RefWriter;->refs:Ljava/util/Collection;

    goto :goto_0
.end method

.method public constructor <init>(Lorg/eclipse/jgit/util/RefList;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/util/RefList",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 95
    .local p1, refs:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    invoke-virtual {p1}, Lorg/eclipse/jgit/util/RefList;->asList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/RefWriter;->refs:Ljava/util/Collection;

    .line 97
    return-void
.end method


# virtual methods
.method protected abstract writeFile(Ljava/lang/String;[B)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public writeInfoRefs()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x9

    .line 111
    new-instance v3, Ljava/io/StringWriter;

    invoke-direct {v3}, Ljava/io/StringWriter;-><init>()V

    .line 112
    .local v3, w:Ljava/io/StringWriter;
    const/16 v4, 0x28

    new-array v2, v4, [C

    .line 113
    .local v2, tmp:[C
    iget-object v4, p0, Lorg/eclipse/jgit/lib/RefWriter;->refs:Ljava/util/Collection;

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/lib/Ref;

    .line 114
    .local v1, r:Lorg/eclipse/jgit/lib/Ref;
    const-string v4, "HEAD"

    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 122
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    invoke-virtual {v4, v2, v3}, Lorg/eclipse/jgit/lib/ObjectId;->copyTo([CLjava/io/Writer;)V

    .line 123
    invoke-virtual {v3, v6}, Ljava/io/StringWriter;->write(I)V

    .line 124
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/StringWriter;->write(Ljava/lang/String;)V

    .line 125
    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Ljava/io/StringWriter;->write(I)V

    .line 127
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 128
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    invoke-virtual {v4, v2, v3}, Lorg/eclipse/jgit/lib/ObjectId;->copyTo([CLjava/io/Writer;)V

    .line 129
    invoke-virtual {v3, v6}, Ljava/io/StringWriter;->write(I)V

    .line 130
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/StringWriter;->write(Ljava/lang/String;)V

    .line 131
    const-string v4, "^{}\n"

    invoke-virtual {v3, v4}, Ljava/io/StringWriter;->write(Ljava/lang/String;)V

    goto :goto_0

    .line 134
    .end local v1           #r:Lorg/eclipse/jgit/lib/Ref;
    :cond_1
    const-string v4, "info/refs"

    invoke-virtual {v3}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lorg/eclipse/jgit/lib/RefWriter;->writeFile(Ljava/lang/String;[B)V

    .line 135
    return-void
.end method

.method public writePackedRefs()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v7, 0xa

    .line 149
    const/4 v1, 0x0

    .line 150
    .local v1, peeled:Z
    iget-object v5, p0, Lorg/eclipse/jgit/lib/RefWriter;->refs:Ljava/util/Collection;

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/lib/Ref;

    .line 151
    .local v2, r:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v2}, Lorg/eclipse/jgit/lib/Ref;->getStorage()Lorg/eclipse/jgit/lib/Ref$Storage;

    move-result-object v5

    invoke-virtual {v5}, Lorg/eclipse/jgit/lib/Ref$Storage;->isPacked()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v2}, Lorg/eclipse/jgit/lib/Ref;->isPeeled()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 152
    const/4 v1, 0x1

    .line 157
    .end local v2           #r:Lorg/eclipse/jgit/lib/Ref;
    :cond_1
    new-instance v4, Ljava/io/StringWriter;

    invoke-direct {v4}, Ljava/io/StringWriter;-><init>()V

    .line 158
    .local v4, w:Ljava/io/StringWriter;
    if-eqz v1, :cond_3

    .line 159
    const-string v5, "# pack-refs with:"

    invoke-virtual {v4, v5}, Ljava/io/StringWriter;->write(Ljava/lang/String;)V

    .line 160
    if-eqz v1, :cond_2

    .line 161
    const-string v5, " peeled"

    invoke-virtual {v4, v5}, Ljava/io/StringWriter;->write(Ljava/lang/String;)V

    .line 162
    :cond_2
    invoke-virtual {v4, v7}, Ljava/io/StringWriter;->write(I)V

    .line 165
    :cond_3
    const/16 v5, 0x28

    new-array v3, v5, [C

    .line 166
    .local v3, tmp:[C
    iget-object v5, p0, Lorg/eclipse/jgit/lib/RefWriter;->refs:Ljava/util/Collection;

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_4
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/lib/Ref;

    .line 167
    .restart local v2       #r:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v2}, Lorg/eclipse/jgit/lib/Ref;->getStorage()Lorg/eclipse/jgit/lib/Ref$Storage;

    move-result-object v5

    sget-object v6, Lorg/eclipse/jgit/lib/Ref$Storage;->PACKED:Lorg/eclipse/jgit/lib/Ref$Storage;

    if-ne v5, v6, :cond_4

    .line 170
    invoke-interface {v2}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    invoke-virtual {v5, v3, v4}, Lorg/eclipse/jgit/lib/ObjectId;->copyTo([CLjava/io/Writer;)V

    .line 171
    const/16 v5, 0x20

    invoke-virtual {v4, v5}, Ljava/io/StringWriter;->write(I)V

    .line 172
    invoke-interface {v2}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/StringWriter;->write(Ljava/lang/String;)V

    .line 173
    invoke-virtual {v4, v7}, Ljava/io/StringWriter;->write(I)V

    .line 175
    invoke-interface {v2}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    if-eqz v5, :cond_4

    .line 176
    const/16 v5, 0x5e

    invoke-virtual {v4, v5}, Ljava/io/StringWriter;->write(I)V

    .line 177
    invoke-interface {v2}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    invoke-virtual {v5, v3, v4}, Lorg/eclipse/jgit/lib/ObjectId;->copyTo([CLjava/io/Writer;)V

    .line 178
    invoke-virtual {v4, v7}, Ljava/io/StringWriter;->write(I)V

    goto :goto_0

    .line 181
    .end local v2           #r:Lorg/eclipse/jgit/lib/Ref;
    :cond_5
    const-string v5, "packed-refs"

    invoke-virtual {v4}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lorg/eclipse/jgit/lib/RefWriter;->writeFile(Ljava/lang/String;[B)V

    .line 182
    return-void
.end method
