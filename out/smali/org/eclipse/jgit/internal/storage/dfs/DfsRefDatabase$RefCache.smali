.class public Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;
.super Ljava/lang/Object;
.source "DfsRefDatabase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RefCache"
.end annotation


# instance fields
.field final ids:Lorg/eclipse/jgit/util/RefList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/util/RefList",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation
.end field

.field final sym:Lorg/eclipse/jgit/util/RefList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/util/RefList",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/util/RefList;Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;)V
    .locals 1
    .parameter
    .parameter "old"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/util/RefList",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;",
            ")V"
        }
    .end annotation

    .prologue
    .line 388
    .local p1, ids:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/lib/Ref;>;"
    iget-object v0, p2, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;->sym:Lorg/eclipse/jgit/util/RefList;

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;-><init>(Lorg/eclipse/jgit/util/RefList;Lorg/eclipse/jgit/util/RefList;)V

    .line 389
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/util/RefList;Lorg/eclipse/jgit/util/RefList;)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/util/RefList",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;",
            "Lorg/eclipse/jgit/util/RefList",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 382
    .local p1, ids:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/lib/Ref;>;"
    .local p2, sym:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 383
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;->ids:Lorg/eclipse/jgit/util/RefList;

    .line 384
    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;->sym:Lorg/eclipse/jgit/util/RefList;

    .line 385
    return-void
.end method


# virtual methods
.method public get(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;
    .locals 1
    .parameter "name"

    .prologue
    .line 404
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;->ids:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/util/RefList;->get(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    return-object v0
.end method

.method public put(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;
    .locals 4
    .parameter "ref"

    .prologue
    .line 417
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;->ids:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v3, p1}, Lorg/eclipse/jgit/util/RefList;->put(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/util/RefList;

    move-result-object v0

    .line 418
    .local v0, newIds:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/lib/Ref;>;"
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;->sym:Lorg/eclipse/jgit/util/RefList;

    .line 419
    .local v1, newSym:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->isSymbolic()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 420
    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/util/RefList;->put(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/util/RefList;

    move-result-object v1

    .line 426
    :cond_0
    :goto_0
    new-instance v3, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;

    invoke-direct {v3, v0, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;-><init>(Lorg/eclipse/jgit/util/RefList;Lorg/eclipse/jgit/util/RefList;)V

    return-object v3

    .line 422
    :cond_1
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/eclipse/jgit/util/RefList;->find(Ljava/lang/String;)I

    move-result v2

    .line 423
    .local v2, p:I
    if-ltz v2, :cond_0

    .line 424
    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/util/RefList;->remove(I)Lorg/eclipse/jgit/util/RefList;

    move-result-object v1

    goto :goto_0
.end method

.method public remove(Ljava/lang/String;)Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;
    .locals 4
    .parameter "refName"

    .prologue
    .line 439
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;->ids:Lorg/eclipse/jgit/util/RefList;

    .line 440
    .local v0, newIds:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/util/RefList;->find(Ljava/lang/String;)I

    move-result v2

    .line 441
    .local v2, p:I
    if-ltz v2, :cond_0

    .line 442
    invoke-virtual {v0, v2}, Lorg/eclipse/jgit/util/RefList;->remove(I)Lorg/eclipse/jgit/util/RefList;

    move-result-object v0

    .line 444
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;->sym:Lorg/eclipse/jgit/util/RefList;

    .line 445
    .local v1, newSym:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/util/RefList;->find(Ljava/lang/String;)I

    move-result v2

    .line 446
    if-ltz v2, :cond_1

    .line 447
    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/util/RefList;->remove(I)Lorg/eclipse/jgit/util/RefList;

    move-result-object v1

    .line 448
    :cond_1
    new-instance v3, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;

    invoke-direct {v3, v0, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;-><init>(Lorg/eclipse/jgit/util/RefList;Lorg/eclipse/jgit/util/RefList;)V

    return-object v3
.end method

.method public size()I
    .locals 1

    .prologue
    .line 393
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;->ids:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/RefList;->size()I

    move-result v0

    return v0
.end method
