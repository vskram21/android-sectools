.class public Lorg/eclipse/jgit/transport/BundleWriter;
.super Ljava/lang/Object;
.source "BundleWriter.java"


# instance fields
.field private final assume:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/revwalk/RevCommit;",
            ">;"
        }
    .end annotation
.end field

.field private final db:Lorg/eclipse/jgit/lib/Repository;

.field private final include:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation
.end field

.field private packConfig:Lorg/eclipse/jgit/storage/pack/PackConfig;

.field private final tagTargets:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repo"

    .prologue
    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 102
    iput-object p1, p0, Lorg/eclipse/jgit/transport/BundleWriter;->db:Lorg/eclipse/jgit/lib/Repository;

    .line 103
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/BundleWriter;->include:Ljava/util/Map;

    .line 104
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/BundleWriter;->assume:Ljava/util/Set;

    .line 105
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/BundleWriter;->tagTargets:Ljava/util/Set;

    .line 106
    return-void
.end method


# virtual methods
.method public assume(Lorg/eclipse/jgit/revwalk/RevCommit;)V
    .locals 1
    .parameter "c"

    .prologue
    .line 171
    if-eqz p1, :cond_0

    .line 172
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BundleWriter;->assume:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 173
    :cond_0
    return-void
.end method

.method public include(Ljava/lang/String;Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 4
    .parameter "name"
    .parameter "id"

    .prologue
    .line 131
    invoke-static {p1}, Lorg/eclipse/jgit/lib/Repository;->isValidRefName(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 132
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->invalidRefName:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 133
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BundleWriter;->include:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 134
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->duplicateRef:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 135
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BundleWriter;->include:Ljava/util/Map;

    invoke-virtual {p2}, Lorg/eclipse/jgit/lib/AnyObjectId;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    return-void
.end method

.method public include(Lorg/eclipse/jgit/lib/Ref;)V
    .locals 2
    .parameter "r"

    .prologue
    .line 148
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/transport/BundleWriter;->include(Ljava/lang/String;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 150
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 151
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BundleWriter;->tagTargets:Ljava/util/Set;

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 156
    :cond_0
    :goto_0
    return-void

    .line 153
    :cond_1
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "refs/heads/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 155
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BundleWriter;->tagTargets:Ljava/util/Set;

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public setPackConfig(Lorg/eclipse/jgit/storage/pack/PackConfig;)V
    .locals 0
    .parameter "pc"

    .prologue
    .line 116
    iput-object p1, p0, Lorg/eclipse/jgit/transport/BundleWriter;->packConfig:Lorg/eclipse/jgit/storage/pack/PackConfig;

    .line 117
    return-void
.end method

.method public writeBundle(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/io/OutputStream;)V
    .locals 13
    .parameter "monitor"
    .parameter "os"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x1

    .line 193
    iget-object v6, p0, Lorg/eclipse/jgit/transport/BundleWriter;->packConfig:Lorg/eclipse/jgit/storage/pack/PackConfig;

    .line 194
    .local v6, pc:Lorg/eclipse/jgit/storage/pack/PackConfig;
    if-nez v6, :cond_0

    .line 195
    new-instance v6, Lorg/eclipse/jgit/storage/pack/PackConfig;

    .end local v6           #pc:Lorg/eclipse/jgit/storage/pack/PackConfig;
    iget-object v12, p0, Lorg/eclipse/jgit/transport/BundleWriter;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v6, v12}, Lorg/eclipse/jgit/storage/pack/PackConfig;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 196
    .restart local v6       #pc:Lorg/eclipse/jgit/storage/pack/PackConfig;
    :cond_0
    new-instance v5, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

    iget-object v12, p0, Lorg/eclipse/jgit/transport/BundleWriter;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v12}, Lorg/eclipse/jgit/lib/Repository;->newObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v12

    invoke-direct {v5, v6, v12}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;-><init>(Lorg/eclipse/jgit/storage/pack/PackConfig;Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 198
    .local v5, packWriter:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;
    :try_start_0
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 199
    .local v4, inc:Ljava/util/HashSet;,"Ljava/util/HashSet<Lorg/eclipse/jgit/lib/ObjectId;>;"
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 200
    .local v2, exc:Ljava/util/HashSet;,"Ljava/util/HashSet<Lorg/eclipse/jgit/lib/ObjectId;>;"
    iget-object v12, p0, Lorg/eclipse/jgit/transport/BundleWriter;->include:Ljava/util/Map;

    invoke-interface {v12}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v12

    invoke-virtual {v4, v12}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    .line 201
    iget-object v12, p0, Lorg/eclipse/jgit/transport/BundleWriter;->assume:Ljava/util/Set;

    invoke-interface {v12}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 202
    .local v7, r:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual {v7}, Lorg/eclipse/jgit/revwalk/RevCommit;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v12

    invoke-virtual {v2, v12}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 236
    .end local v2           #exc:Ljava/util/HashSet;,"Ljava/util/HashSet<Lorg/eclipse/jgit/lib/ObjectId;>;"
    .end local v3           #i$:Ljava/util/Iterator;
    .end local v4           #inc:Ljava/util/HashSet;,"Ljava/util/HashSet<Lorg/eclipse/jgit/lib/ObjectId;>;"
    .end local v7           #r:Lorg/eclipse/jgit/revwalk/RevCommit;
    :catchall_0
    move-exception v10

    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->release()V

    throw v10

    .line 203
    .restart local v2       #exc:Ljava/util/HashSet;,"Ljava/util/HashSet<Lorg/eclipse/jgit/lib/ObjectId;>;"
    .restart local v3       #i$:Ljava/util/Iterator;
    .restart local v4       #inc:Ljava/util/HashSet;,"Ljava/util/HashSet<Lorg/eclipse/jgit/lib/ObjectId;>;"
    :cond_1
    const/4 v12, 0x1

    :try_start_1
    invoke-virtual {v5, v12}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->setIndexDisabled(Z)V

    .line 204
    const/4 v12, 0x1

    invoke-virtual {v5, v12}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->setDeltaBaseAsOffset(Z)V

    .line 205
    invoke-virtual {v2}, Ljava/util/HashSet;->size()I

    move-result v12

    if-lez v12, :cond_4

    :goto_1
    invoke-virtual {v5, v10}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->setThin(Z)V

    .line 206
    const/4 v10, 0x0

    invoke-virtual {v5, v10}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->setReuseValidatingObjects(Z)V

    .line 207
    invoke-virtual {v2}, Ljava/util/HashSet;->size()I

    move-result v10

    if-nez v10, :cond_2

    .line 208
    iget-object v10, p0, Lorg/eclipse/jgit/transport/BundleWriter;->tagTargets:Ljava/util/Set;

    invoke-virtual {v5, v10}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->setTagTargets(Ljava/util/Set;)V

    .line 209
    :cond_2
    invoke-virtual {v5, p1, v4, v2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->preparePack(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Set;Ljava/util/Set;)V

    .line 211
    new-instance v9, Ljava/io/OutputStreamWriter;

    sget-object v10, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    invoke-direct {v9, p2, v10}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    .line 212
    .local v9, w:Ljava/io/Writer;
    const-string v10, "# v2 git bundle"

    invoke-virtual {v9, v10}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 213
    const/16 v10, 0xa

    invoke-virtual {v9, v10}, Ljava/io/Writer;->write(I)V

    .line 215
    const/16 v10, 0x28

    new-array v8, v10, [C

    .line 216
    .local v8, tmp:[C
    iget-object v10, p0, Lorg/eclipse/jgit/transport/BundleWriter;->assume:Ljava/util/Set;

    invoke-interface {v10}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 217
    .local v0, a:Lorg/eclipse/jgit/revwalk/RevCommit;
    const/16 v10, 0x2d

    invoke-virtual {v9, v10}, Ljava/io/Writer;->write(I)V

    .line 218
    invoke-virtual {v0, v8, v9}, Lorg/eclipse/jgit/revwalk/RevCommit;->copyTo([CLjava/io/Writer;)V

    .line 219
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getRawBuffer()[B

    move-result-object v10

    if-eqz v10, :cond_3

    .line 220
    const/16 v10, 0x20

    invoke-virtual {v9, v10}, Ljava/io/Writer;->write(I)V

    .line 221
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getShortMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 223
    :cond_3
    const/16 v10, 0xa

    invoke-virtual {v9, v10}, Ljava/io/Writer;->write(I)V

    goto :goto_2

    .end local v0           #a:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v8           #tmp:[C
    .end local v9           #w:Ljava/io/Writer;
    :cond_4
    move v10, v11

    .line 205
    goto :goto_1

    .line 225
    .restart local v8       #tmp:[C
    .restart local v9       #w:Ljava/io/Writer;
    :cond_5
    iget-object v10, p0, Lorg/eclipse/jgit/transport/BundleWriter;->include:Ljava/util/Map;

    invoke-interface {v10}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 226
    .local v1, e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v10, v8, v9}, Lorg/eclipse/jgit/lib/ObjectId;->copyTo([CLjava/io/Writer;)V

    .line 227
    const/16 v10, 0x20

    invoke-virtual {v9, v10}, Ljava/io/Writer;->write(I)V

    .line 228
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 229
    const/16 v10, 0xa

    invoke-virtual {v9, v10}, Ljava/io/Writer;->write(I)V

    goto :goto_3

    .line 232
    .end local v1           #e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;>;"
    :cond_6
    const/16 v10, 0xa

    invoke-virtual {v9, v10}, Ljava/io/Writer;->write(I)V

    .line 233
    invoke-virtual {v9}, Ljava/io/Writer;->flush()V

    .line 234
    invoke-virtual {v5, p1, p1, p2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->writePack(Lorg/eclipse/jgit/lib/ProgressMonitor;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/io/OutputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 236
    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->release()V

    .line 238
    return-void
.end method
