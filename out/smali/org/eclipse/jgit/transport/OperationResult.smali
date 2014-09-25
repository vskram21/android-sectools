.class public abstract Lorg/eclipse/jgit/transport/OperationResult;
.super Ljava/lang/Object;
.source "OperationResult.java"


# instance fields
.field advertisedRefs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation
.end field

.field messageBuffer:Ljava/lang/StringBuilder;

.field final updates:Ljava/util/SortedMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/SortedMap",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/transport/TrackingRefUpdate;",
            ">;"
        }
    .end annotation
.end field

.field uri:Lorg/eclipse/jgit/transport/URIish;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/OperationResult;->advertisedRefs:Ljava/util/Map;

    .line 67
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/OperationResult;->updates:Ljava/util/SortedMap;

    return-void
.end method


# virtual methods
.method add(Lorg/eclipse/jgit/transport/TrackingRefUpdate;)V
    .locals 2
    .parameter "u"

    .prologue
    .line 140
    iget-object v0, p0, Lorg/eclipse/jgit/transport/OperationResult;->updates:Ljava/util/SortedMap;

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->getLocalName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/SortedMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    return-void
.end method

.method addMessages(Ljava/lang/String;)V
    .locals 2
    .parameter "msg"

    .prologue
    .line 160
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    .line 161
    iget-object v0, p0, Lorg/eclipse/jgit/transport/OperationResult;->messageBuffer:Ljava/lang/StringBuilder;

    if-nez v0, :cond_0

    .line 162
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/OperationResult;->messageBuffer:Ljava/lang/StringBuilder;

    .line 163
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/OperationResult;->messageBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    const-string v0, "\n"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 165
    iget-object v0, p0, Lorg/eclipse/jgit/transport/OperationResult;->messageBuffer:Ljava/lang/StringBuilder;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 167
    :cond_1
    return-void
.end method

.method public final getAdvertisedRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;
    .locals 1
    .parameter "name"

    .prologue
    .line 109
    iget-object v0, p0, Lorg/eclipse/jgit/transport/OperationResult;->advertisedRefs:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/Ref;

    return-object v0
.end method

.method public getAdvertisedRefs()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .prologue
    .line 94
    iget-object v0, p0, Lorg/eclipse/jgit/transport/OperationResult;->advertisedRefs:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getMessages()Ljava/lang/String;
    .locals 1

    .prologue
    .line 156
    iget-object v0, p0, Lorg/eclipse/jgit/transport/OperationResult;->messageBuffer:Ljava/lang/StringBuilder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/transport/OperationResult;->messageBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method public getTrackingRefUpdate(Ljava/lang/String;)Lorg/eclipse/jgit/transport/TrackingRefUpdate;
    .locals 1
    .parameter "localName"

    .prologue
    .line 131
    iget-object v0, p0, Lorg/eclipse/jgit/transport/OperationResult;->updates:Ljava/util/SortedMap;

    invoke-interface {v0, p1}, Ljava/util/SortedMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/transport/TrackingRefUpdate;

    return-object v0
.end method

.method public getTrackingRefUpdates()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/transport/TrackingRefUpdate;",
            ">;"
        }
    .end annotation

    .prologue
    .line 119
    iget-object v0, p0, Lorg/eclipse/jgit/transport/OperationResult;->updates:Ljava/util/SortedMap;

    invoke-interface {v0}, Ljava/util/SortedMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getURI()Lorg/eclipse/jgit/transport/URIish;
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lorg/eclipse/jgit/transport/OperationResult;->uri:Lorg/eclipse/jgit/transport/URIish;

    return-object v0
.end method

.method setAdvertisedRefs(Lorg/eclipse/jgit/transport/URIish;Ljava/util/Map;)V
    .locals 0
    .parameter "u"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/transport/URIish;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 135
    .local p2, ar:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    iput-object p1, p0, Lorg/eclipse/jgit/transport/OperationResult;->uri:Lorg/eclipse/jgit/transport/URIish;

    .line 136
    iput-object p2, p0, Lorg/eclipse/jgit/transport/OperationResult;->advertisedRefs:Ljava/util/Map;

    .line 137
    return-void
.end method
