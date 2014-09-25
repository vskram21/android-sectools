.class public abstract Lorg/eclipse/jgit/transport/RefAdvertiser;
.super Ljava/lang/Object;
.source "RefAdvertiser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/transport/RefAdvertiser$PacketLineOutRefAdvertiser;
    }
.end annotation


# instance fields
.field private final capablities:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private derefTags:Z

.field private first:Z

.field private repository:Lorg/eclipse/jgit/lib/Repository;

.field private final sent:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation
.end field

.field private final tmpId:[C

.field private final tmpLine:Ljava/lang/StringBuilder;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x64

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/RefAdvertiser;->tmpLine:Ljava/lang/StringBuilder;

    .line 90
    const/16 v0, 0x28

    new-array v0, v0, [C

    iput-object v0, p0, Lorg/eclipse/jgit/transport/RefAdvertiser;->tmpId:[C

    .line 92
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/RefAdvertiser;->capablities:Ljava/util/Set;

    .line 94
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/RefAdvertiser;->sent:Ljava/util/Set;

    .line 100
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/RefAdvertiser;->first:Z

    return-void
.end method

.method private advertiseAny(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)V
    .locals 2
    .parameter "obj"
    .parameter "refName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 220
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RefAdvertiser;->sent:Ljava/util/Set;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 221
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/transport/RefAdvertiser;->advertiseId(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)V

    .line 222
    return-void
.end method

.method private advertiseAnyOnce(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)V
    .locals 1
    .parameter "obj"
    .parameter "refName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 214
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RefAdvertiser;->sent:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 215
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/transport/RefAdvertiser;->advertiseAny(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)V

    .line 216
    :cond_0
    return-void
.end method

.method private getSortedRefs(Ljava/util/Map;)Ljava/lang/Iterable;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;)",
            "Ljava/lang/Iterable",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .prologue
    .line 183
    .local p1, all:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    instance-of v0, p1, Lorg/eclipse/jgit/util/RefMap;

    if-nez v0, :cond_0

    instance-of v0, p1, Ljava/util/SortedMap;

    if-eqz v0, :cond_1

    move-object v0, p1

    check-cast v0, Ljava/util/SortedMap;

    invoke-interface {v0}, Ljava/util/SortedMap;->comparator()Ljava/util/Comparator;

    move-result-object v0

    if-nez v0, :cond_1

    .line 185
    :cond_0
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    .line 186
    :goto_0
    return-object v0

    :cond_1
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/RefComparator;->sort(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public advertiseCapability(Ljava/lang/String;)V
    .locals 1
    .parameter "name"

    .prologue
    .line 145
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RefAdvertiser;->capablities:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 146
    return-void
.end method

.method public advertiseHave(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 1
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 204
    const-string v0, ".have"

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/transport/RefAdvertiser;->advertiseAnyOnce(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)V

    .line 205
    return-void
.end method

.method public advertiseId(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)V
    .locals 6
    .parameter "id"
    .parameter "refName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x20

    const/4 v4, 0x0

    .line 241
    iget-object v2, p0, Lorg/eclipse/jgit/transport/RefAdvertiser;->tmpLine:Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 242
    iget-object v2, p0, Lorg/eclipse/jgit/transport/RefAdvertiser;->tmpId:[C

    iget-object v3, p0, Lorg/eclipse/jgit/transport/RefAdvertiser;->tmpLine:Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2, v3}, Lorg/eclipse/jgit/lib/AnyObjectId;->copyTo([CLjava/lang/StringBuilder;)V

    .line 243
    iget-object v2, p0, Lorg/eclipse/jgit/transport/RefAdvertiser;->tmpLine:Ljava/lang/StringBuilder;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 244
    iget-object v2, p0, Lorg/eclipse/jgit/transport/RefAdvertiser;->tmpLine:Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 245
    iget-boolean v2, p0, Lorg/eclipse/jgit/transport/RefAdvertiser;->first:Z

    if-eqz v2, :cond_1

    .line 246
    iput-boolean v4, p0, Lorg/eclipse/jgit/transport/RefAdvertiser;->first:Z

    .line 247
    iget-object v2, p0, Lorg/eclipse/jgit/transport/RefAdvertiser;->capablities:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 248
    iget-object v2, p0, Lorg/eclipse/jgit/transport/RefAdvertiser;->tmpLine:Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 249
    iget-object v2, p0, Lorg/eclipse/jgit/transport/RefAdvertiser;->capablities:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 250
    .local v0, capName:Ljava/lang/String;
    iget-object v2, p0, Lorg/eclipse/jgit/transport/RefAdvertiser;->tmpLine:Ljava/lang/StringBuilder;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 251
    iget-object v2, p0, Lorg/eclipse/jgit/transport/RefAdvertiser;->tmpLine:Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 253
    .end local v0           #capName:Ljava/lang/String;
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/transport/RefAdvertiser;->tmpLine:Ljava/lang/StringBuilder;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 256
    .end local v1           #i$:Ljava/util/Iterator;
    :cond_1
    iget-object v2, p0, Lorg/eclipse/jgit/transport/RefAdvertiser;->tmpLine:Ljava/lang/StringBuilder;

    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 257
    iget-object v2, p0, Lorg/eclipse/jgit/transport/RefAdvertiser;->tmpLine:Ljava/lang/StringBuilder;

    invoke-virtual {p0, v2}, Lorg/eclipse/jgit/transport/RefAdvertiser;->writeOne(Ljava/lang/CharSequence;)V

    .line 258
    return-void
.end method

.method protected abstract end()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public init(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 0
    .parameter "src"

    .prologue
    .line 109
    iput-object p1, p0, Lorg/eclipse/jgit/transport/RefAdvertiser;->repository:Lorg/eclipse/jgit/lib/Repository;

    .line 110
    return-void
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 209
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/RefAdvertiser;->first:Z

    return v0
.end method

.method public send(Ljava/util/Map;)Ljava/util/Set;
    .locals 5
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;)",
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

    .prologue
    .line 161
    .local p1, refs:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/RefAdvertiser;->getSortedRefs(Ljava/util/Map;)Ljava/lang/Iterable;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/lib/Ref;

    .line 162
    .local v1, ref:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 165
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lorg/eclipse/jgit/transport/RefAdvertiser;->advertiseAny(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)V

    .line 167
    iget-boolean v2, p0, Lorg/eclipse/jgit/transport/RefAdvertiser;->derefTags:Z

    if-eqz v2, :cond_0

    .line 170
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->isPeeled()Z

    move-result v2

    if-nez v2, :cond_1

    .line 171
    iget-object v2, p0, Lorg/eclipse/jgit/transport/RefAdvertiser;->repository:Lorg/eclipse/jgit/lib/Repository;

    if-eqz v2, :cond_0

    .line 173
    iget-object v2, p0, Lorg/eclipse/jgit/transport/RefAdvertiser;->repository:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v2, v1}, Lorg/eclipse/jgit/lib/Repository;->peel(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    .line 176
    :cond_1
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 177
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "^{}"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lorg/eclipse/jgit/transport/RefAdvertiser;->advertiseAny(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)V

    goto :goto_0

    .line 179
    .end local v1           #ref:Lorg/eclipse/jgit/lib/Ref;
    :cond_2
    iget-object v2, p0, Lorg/eclipse/jgit/transport/RefAdvertiser;->sent:Ljava/util/Set;

    return-object v2
.end method

.method public setDerefTags(Z)V
    .locals 0
    .parameter "deref"

    .prologue
    .line 126
    iput-boolean p1, p0, Lorg/eclipse/jgit/transport/RefAdvertiser;->derefTags:Z

    .line 127
    return-void
.end method

.method protected abstract writeOne(Ljava/lang/CharSequence;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
