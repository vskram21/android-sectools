.class Lorg/eclipse/jgit/util/RefMap$SetIterator;
.super Ljava/lang/Object;
.source "RefMap.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/util/RefMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SetIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<",
        "Ljava/util/Map$Entry",
        "<",
        "Ljava/lang/String;",
        "Lorg/eclipse/jgit/lib/Ref;",
        ">;>;"
    }
.end annotation


# instance fields
.field private looseIdx:I

.field private next:Ljava/util/Map$Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation
.end field

.field private packedIdx:I

.field private resolvedIdx:I

.field final synthetic this$0:Lorg/eclipse/jgit/util/RefMap;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/util/RefMap;)V
    .locals 2
    .parameter

    .prologue
    .line 299
    iput-object p1, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->this$0:Lorg/eclipse/jgit/util/RefMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 300
    #getter for: Lorg/eclipse/jgit/util/RefMap;->prefix:Ljava/lang/String;
    invoke-static {p1}, Lorg/eclipse/jgit/util/RefMap;->access$500(Lorg/eclipse/jgit/util/RefMap;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 301
    #getter for: Lorg/eclipse/jgit/util/RefMap;->packed:Lorg/eclipse/jgit/util/RefList;
    invoke-static {p1}, Lorg/eclipse/jgit/util/RefMap;->access$200(Lorg/eclipse/jgit/util/RefMap;)Lorg/eclipse/jgit/util/RefList;

    move-result-object v0

    #getter for: Lorg/eclipse/jgit/util/RefMap;->prefix:Ljava/lang/String;
    invoke-static {p1}, Lorg/eclipse/jgit/util/RefMap;->access$500(Lorg/eclipse/jgit/util/RefMap;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/util/RefList;->find(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    neg-int v0, v0

    iput v0, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->packedIdx:I

    .line 302
    #getter for: Lorg/eclipse/jgit/util/RefMap;->loose:Lorg/eclipse/jgit/util/RefList;
    invoke-static {p1}, Lorg/eclipse/jgit/util/RefMap;->access$300(Lorg/eclipse/jgit/util/RefMap;)Lorg/eclipse/jgit/util/RefList;

    move-result-object v0

    #getter for: Lorg/eclipse/jgit/util/RefMap;->prefix:Ljava/lang/String;
    invoke-static {p1}, Lorg/eclipse/jgit/util/RefMap;->access$500(Lorg/eclipse/jgit/util/RefMap;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/util/RefList;->find(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    neg-int v0, v0

    iput v0, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->looseIdx:I

    .line 303
    #getter for: Lorg/eclipse/jgit/util/RefMap;->resolved:Lorg/eclipse/jgit/util/RefList;
    invoke-static {p1}, Lorg/eclipse/jgit/util/RefMap;->access$400(Lorg/eclipse/jgit/util/RefMap;)Lorg/eclipse/jgit/util/RefList;

    move-result-object v0

    #getter for: Lorg/eclipse/jgit/util/RefMap;->prefix:Ljava/lang/String;
    invoke-static {p1}, Lorg/eclipse/jgit/util/RefMap;->access$500(Lorg/eclipse/jgit/util/RefMap;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/util/RefList;->find(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    neg-int v0, v0

    iput v0, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->resolvedIdx:I

    .line 305
    :cond_0
    return-void
.end method

.method private resolveLoose(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/Ref;
    .locals 4
    .parameter "l"

    .prologue
    .line 346
    iget v2, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->resolvedIdx:I

    iget-object v3, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->this$0:Lorg/eclipse/jgit/util/RefMap;

    #getter for: Lorg/eclipse/jgit/util/RefMap;->resolved:Lorg/eclipse/jgit/util/RefList;
    invoke-static {v3}, Lorg/eclipse/jgit/util/RefMap;->access$400(Lorg/eclipse/jgit/util/RefMap;)Lorg/eclipse/jgit/util/RefList;

    move-result-object v3

    invoke-virtual {v3}, Lorg/eclipse/jgit/util/RefList;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 347
    iget-object v2, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->this$0:Lorg/eclipse/jgit/util/RefMap;

    #getter for: Lorg/eclipse/jgit/util/RefMap;->resolved:Lorg/eclipse/jgit/util/RefList;
    invoke-static {v2}, Lorg/eclipse/jgit/util/RefMap;->access$400(Lorg/eclipse/jgit/util/RefMap;)Lorg/eclipse/jgit/util/RefList;

    move-result-object v2

    iget v3, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->resolvedIdx:I

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/util/RefList;->get(I)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    .line 348
    .local v1, r:Lorg/eclipse/jgit/lib/Ref;
    invoke-static {p1, v1}, Lorg/eclipse/jgit/lib/RefComparator;->compareTo(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/Ref;)I

    move-result v0

    .line 349
    .local v0, cmp:I
    if-nez v0, :cond_0

    .line 350
    iget v2, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->resolvedIdx:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->resolvedIdx:I

    .line 358
    .end local v0           #cmp:I
    .end local v1           #r:Lorg/eclipse/jgit/lib/Ref;
    :goto_0
    return-object v1

    .line 352
    .restart local v0       #cmp:I
    .restart local v1       #r:Lorg/eclipse/jgit/lib/Ref;
    :cond_0
    if-lez v0, :cond_1

    .line 355
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2}, Ljava/lang/IllegalStateException;-><init>()V

    throw v2

    .end local v0           #cmp:I
    .end local v1           #r:Lorg/eclipse/jgit/lib/Ref;
    :cond_1
    move-object v1, p1

    .line 358
    goto :goto_0
.end method

.method private toEntry(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/util/RefMap$Ent;
    .locals 2
    .parameter "p"

    .prologue
    .line 362
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->this$0:Lorg/eclipse/jgit/util/RefMap;

    #getter for: Lorg/eclipse/jgit/util/RefMap;->prefix:Ljava/lang/String;
    invoke-static {v1}, Lorg/eclipse/jgit/util/RefMap;->access$500(Lorg/eclipse/jgit/util/RefMap;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 363
    new-instance v0, Lorg/eclipse/jgit/util/RefMap$Ent;

    iget-object v1, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->this$0:Lorg/eclipse/jgit/util/RefMap;

    invoke-direct {v0, v1, p1}, Lorg/eclipse/jgit/util/RefMap$Ent;-><init>(Lorg/eclipse/jgit/util/RefMap;Lorg/eclipse/jgit/lib/Ref;)V

    .line 367
    :goto_0
    return-object v0

    .line 364
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->this$0:Lorg/eclipse/jgit/util/RefMap;

    #getter for: Lorg/eclipse/jgit/util/RefMap;->packed:Lorg/eclipse/jgit/util/RefList;
    invoke-static {v0}, Lorg/eclipse/jgit/util/RefMap;->access$200(Lorg/eclipse/jgit/util/RefMap;)Lorg/eclipse/jgit/util/RefList;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/RefList;->size()I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->packedIdx:I

    .line 365
    iget-object v0, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->this$0:Lorg/eclipse/jgit/util/RefMap;

    #getter for: Lorg/eclipse/jgit/util/RefMap;->loose:Lorg/eclipse/jgit/util/RefList;
    invoke-static {v0}, Lorg/eclipse/jgit/util/RefMap;->access$300(Lorg/eclipse/jgit/util/RefMap;)Lorg/eclipse/jgit/util/RefList;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/RefList;->size()I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->looseIdx:I

    .line 366
    iget-object v0, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->this$0:Lorg/eclipse/jgit/util/RefMap;

    #getter for: Lorg/eclipse/jgit/util/RefMap;->resolved:Lorg/eclipse/jgit/util/RefList;
    invoke-static {v0}, Lorg/eclipse/jgit/util/RefMap;->access$400(Lorg/eclipse/jgit/util/RefMap;)Lorg/eclipse/jgit/util/RefList;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/RefList;->size()I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->resolvedIdx:I

    .line 367
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .prologue
    .line 308
    iget-object v0, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->next:Ljava/util/Map$Entry;

    if-nez v0, :cond_0

    .line 309
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/RefMap$SetIterator;->peek()Ljava/util/Map$Entry;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->next:Ljava/util/Map$Entry;

    .line 310
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->next:Ljava/util/Map$Entry;

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 290
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/RefMap$SetIterator;->next()Ljava/util/Map$Entry;

    move-result-object v0

    return-object v0
.end method

.method public next()Ljava/util/Map$Entry;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .prologue
    .line 314
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/RefMap$SetIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 315
    iget-object v0, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->next:Ljava/util/Map$Entry;

    .line 316
    .local v0, r:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/RefMap$SetIterator;->peek()Ljava/util/Map$Entry;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->next:Ljava/util/Map$Entry;

    .line 317
    return-object v0

    .line 319
    .end local v0           #r:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    :cond_0
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    throw v1
.end method

.method public peek()Ljava/util/Map$Entry;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .prologue
    .line 323
    iget v3, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->packedIdx:I

    iget-object v4, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->this$0:Lorg/eclipse/jgit/util/RefMap;

    #getter for: Lorg/eclipse/jgit/util/RefMap;->packed:Lorg/eclipse/jgit/util/RefList;
    invoke-static {v4}, Lorg/eclipse/jgit/util/RefMap;->access$200(Lorg/eclipse/jgit/util/RefMap;)Lorg/eclipse/jgit/util/RefList;

    move-result-object v4

    invoke-virtual {v4}, Lorg/eclipse/jgit/util/RefList;->size()I

    move-result v4

    if-ge v3, v4, :cond_2

    iget v3, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->looseIdx:I

    iget-object v4, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->this$0:Lorg/eclipse/jgit/util/RefMap;

    #getter for: Lorg/eclipse/jgit/util/RefMap;->loose:Lorg/eclipse/jgit/util/RefList;
    invoke-static {v4}, Lorg/eclipse/jgit/util/RefMap;->access$300(Lorg/eclipse/jgit/util/RefMap;)Lorg/eclipse/jgit/util/RefList;

    move-result-object v4

    invoke-virtual {v4}, Lorg/eclipse/jgit/util/RefList;->size()I

    move-result v4

    if-ge v3, v4, :cond_2

    .line 324
    iget-object v3, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->this$0:Lorg/eclipse/jgit/util/RefMap;

    #getter for: Lorg/eclipse/jgit/util/RefMap;->packed:Lorg/eclipse/jgit/util/RefList;
    invoke-static {v3}, Lorg/eclipse/jgit/util/RefMap;->access$200(Lorg/eclipse/jgit/util/RefMap;)Lorg/eclipse/jgit/util/RefList;

    move-result-object v3

    iget v4, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->packedIdx:I

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/util/RefList;->get(I)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v2

    .line 325
    .local v2, p:Lorg/eclipse/jgit/lib/Ref;
    iget-object v3, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->this$0:Lorg/eclipse/jgit/util/RefMap;

    #getter for: Lorg/eclipse/jgit/util/RefMap;->loose:Lorg/eclipse/jgit/util/RefList;
    invoke-static {v3}, Lorg/eclipse/jgit/util/RefMap;->access$300(Lorg/eclipse/jgit/util/RefMap;)Lorg/eclipse/jgit/util/RefList;

    move-result-object v3

    iget v4, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->looseIdx:I

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/util/RefList;->get(I)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    .line 326
    .local v1, l:Lorg/eclipse/jgit/lib/Ref;
    invoke-static {v2, v1}, Lorg/eclipse/jgit/lib/RefComparator;->compareTo(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/Ref;)I

    move-result v0

    .line 327
    .local v0, cmp:I
    if-gez v0, :cond_0

    .line 328
    iget v3, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->packedIdx:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->packedIdx:I

    .line 329
    invoke-direct {p0, v2}, Lorg/eclipse/jgit/util/RefMap$SetIterator;->toEntry(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/util/RefMap$Ent;

    move-result-object v3

    .line 342
    .end local v0           #cmp:I
    .end local v1           #l:Lorg/eclipse/jgit/lib/Ref;
    .end local v2           #p:Lorg/eclipse/jgit/lib/Ref;
    :goto_0
    return-object v3

    .line 332
    .restart local v0       #cmp:I
    .restart local v1       #l:Lorg/eclipse/jgit/lib/Ref;
    .restart local v2       #p:Lorg/eclipse/jgit/lib/Ref;
    :cond_0
    if-nez v0, :cond_1

    .line 333
    iget v3, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->packedIdx:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->packedIdx:I

    .line 334
    :cond_1
    iget v3, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->looseIdx:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->looseIdx:I

    .line 335
    invoke-direct {p0, v1}, Lorg/eclipse/jgit/util/RefMap$SetIterator;->resolveLoose(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/eclipse/jgit/util/RefMap$SetIterator;->toEntry(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/util/RefMap$Ent;

    move-result-object v3

    goto :goto_0

    .line 338
    .end local v0           #cmp:I
    .end local v1           #l:Lorg/eclipse/jgit/lib/Ref;
    .end local v2           #p:Lorg/eclipse/jgit/lib/Ref;
    :cond_2
    iget v3, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->looseIdx:I

    iget-object v4, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->this$0:Lorg/eclipse/jgit/util/RefMap;

    #getter for: Lorg/eclipse/jgit/util/RefMap;->loose:Lorg/eclipse/jgit/util/RefList;
    invoke-static {v4}, Lorg/eclipse/jgit/util/RefMap;->access$300(Lorg/eclipse/jgit/util/RefMap;)Lorg/eclipse/jgit/util/RefList;

    move-result-object v4

    invoke-virtual {v4}, Lorg/eclipse/jgit/util/RefList;->size()I

    move-result v4

    if-ge v3, v4, :cond_3

    .line 339
    iget-object v3, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->this$0:Lorg/eclipse/jgit/util/RefMap;

    #getter for: Lorg/eclipse/jgit/util/RefMap;->loose:Lorg/eclipse/jgit/util/RefList;
    invoke-static {v3}, Lorg/eclipse/jgit/util/RefMap;->access$300(Lorg/eclipse/jgit/util/RefMap;)Lorg/eclipse/jgit/util/RefList;

    move-result-object v3

    iget v4, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->looseIdx:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->looseIdx:I

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/util/RefList;->get(I)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/eclipse/jgit/util/RefMap$SetIterator;->resolveLoose(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/eclipse/jgit/util/RefMap$SetIterator;->toEntry(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/util/RefMap$Ent;

    move-result-object v3

    goto :goto_0

    .line 340
    :cond_3
    iget v3, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->packedIdx:I

    iget-object v4, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->this$0:Lorg/eclipse/jgit/util/RefMap;

    #getter for: Lorg/eclipse/jgit/util/RefMap;->packed:Lorg/eclipse/jgit/util/RefList;
    invoke-static {v4}, Lorg/eclipse/jgit/util/RefMap;->access$200(Lorg/eclipse/jgit/util/RefMap;)Lorg/eclipse/jgit/util/RefList;

    move-result-object v4

    invoke-virtual {v4}, Lorg/eclipse/jgit/util/RefList;->size()I

    move-result v4

    if-ge v3, v4, :cond_4

    .line 341
    iget-object v3, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->this$0:Lorg/eclipse/jgit/util/RefMap;

    #getter for: Lorg/eclipse/jgit/util/RefMap;->packed:Lorg/eclipse/jgit/util/RefList;
    invoke-static {v3}, Lorg/eclipse/jgit/util/RefMap;->access$200(Lorg/eclipse/jgit/util/RefMap;)Lorg/eclipse/jgit/util/RefList;

    move-result-object v3

    iget v4, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->packedIdx:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/eclipse/jgit/util/RefMap$SetIterator;->packedIdx:I

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/util/RefList;->get(I)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/eclipse/jgit/util/RefMap$SetIterator;->toEntry(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/util/RefMap$Ent;

    move-result-object v3

    goto :goto_0

    .line 342
    :cond_4
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 371
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
