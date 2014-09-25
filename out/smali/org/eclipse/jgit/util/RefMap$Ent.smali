.class Lorg/eclipse/jgit/util/RefMap$Ent;
.super Ljava/lang/Object;
.source "RefMap.java"

# interfaces
.implements Ljava/util/Map$Entry;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/util/RefMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Ent"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Map$Entry",
        "<",
        "Ljava/lang/String;",
        "Lorg/eclipse/jgit/lib/Ref;",
        ">;"
    }
.end annotation


# instance fields
.field private ref:Lorg/eclipse/jgit/lib/Ref;

.field final synthetic this$0:Lorg/eclipse/jgit/util/RefMap;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/util/RefMap;Lorg/eclipse/jgit/lib/Ref;)V
    .locals 0
    .parameter
    .parameter "ref"

    .prologue
    .line 378
    iput-object p1, p0, Lorg/eclipse/jgit/util/RefMap$Ent;->this$0:Lorg/eclipse/jgit/util/RefMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 379
    iput-object p2, p0, Lorg/eclipse/jgit/util/RefMap$Ent;->ref:Lorg/eclipse/jgit/lib/Ref;

    .line 380
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .parameter "obj"

    .prologue
    .line 403
    instance-of v5, p1, Ljava/util/Map$Entry;

    if-eqz v5, :cond_0

    move-object v5, p1

    .line 404
    check-cast v5, Ljava/util/Map$Entry;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    .line 405
    .local v2, key:Ljava/lang/Object;
    check-cast p1, Ljava/util/Map$Entry;

    .end local p1
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    .line 406
    .local v4, val:Ljava/lang/Object;
    instance-of v5, v2, Ljava/lang/String;

    if-eqz v5, :cond_0

    instance-of v5, v4, Lorg/eclipse/jgit/lib/Ref;

    if-eqz v5, :cond_0

    move-object v3, v4

    .line 407
    check-cast v3, Lorg/eclipse/jgit/lib/Ref;

    .line 408
    .local v3, r:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v3}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lorg/eclipse/jgit/util/RefMap$Ent;->ref:Lorg/eclipse/jgit/lib/Ref;

    invoke-interface {v6}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 409
    invoke-interface {v3}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    .line 410
    .local v0, a:Lorg/eclipse/jgit/lib/ObjectId;
    iget-object v5, p0, Lorg/eclipse/jgit/util/RefMap$Ent;->ref:Lorg/eclipse/jgit/lib/Ref;

    invoke-interface {v5}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    .line 411
    .local v1, b:Lorg/eclipse/jgit/lib/ObjectId;
    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    invoke-static {v0, v1}, Lorg/eclipse/jgit/lib/AnyObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 412
    const/4 v5, 0x1

    .line 416
    .end local v0           #a:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v1           #b:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v2           #key:Ljava/lang/Object;
    .end local v3           #r:Lorg/eclipse/jgit/lib/Ref;
    .end local v4           #val:Ljava/lang/Object;
    :goto_0
    return v5

    :cond_0
    const/4 v5, 0x0

    goto :goto_0
.end method

.method public bridge synthetic getKey()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 375
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/RefMap$Ent;->getKey()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getKey()Ljava/lang/String;
    .locals 2

    .prologue
    .line 383
    iget-object v0, p0, Lorg/eclipse/jgit/util/RefMap$Ent;->this$0:Lorg/eclipse/jgit/util/RefMap;

    iget-object v1, p0, Lorg/eclipse/jgit/util/RefMap$Ent;->ref:Lorg/eclipse/jgit/lib/Ref;

    #calls: Lorg/eclipse/jgit/util/RefMap;->toMapKey(Lorg/eclipse/jgit/lib/Ref;)Ljava/lang/String;
    invoke-static {v0, v1}, Lorg/eclipse/jgit/util/RefMap;->access$600(Lorg/eclipse/jgit/util/RefMap;Lorg/eclipse/jgit/lib/Ref;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 375
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/RefMap$Ent;->getValue()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    return-object v0
.end method

.method public getValue()Lorg/eclipse/jgit/lib/Ref;
    .locals 1

    .prologue
    .line 387
    iget-object v0, p0, Lorg/eclipse/jgit/util/RefMap$Ent;->ref:Lorg/eclipse/jgit/lib/Ref;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 398
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/RefMap$Ent;->getKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public bridge synthetic setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 375
    check-cast p1, Lorg/eclipse/jgit/lib/Ref;

    .end local p1
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/util/RefMap$Ent;->setValue(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    return-object v0
.end method

.method public setValue(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/Ref;
    .locals 3
    .parameter "value"

    .prologue
    .line 391
    iget-object v1, p0, Lorg/eclipse/jgit/util/RefMap$Ent;->this$0:Lorg/eclipse/jgit/util/RefMap;

    invoke-virtual {p0}, Lorg/eclipse/jgit/util/RefMap$Ent;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, p1}, Lorg/eclipse/jgit/util/RefMap;->put(Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    .line 392
    .local v0, prior:Lorg/eclipse/jgit/lib/Ref;
    iput-object p1, p0, Lorg/eclipse/jgit/util/RefMap$Ent;->ref:Lorg/eclipse/jgit/lib/Ref;

    .line 393
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 421
    iget-object v0, p0, Lorg/eclipse/jgit/util/RefMap$Ent;->ref:Lorg/eclipse/jgit/lib/Ref;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
