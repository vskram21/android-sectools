.class public Lorg/eclipse/jgit/util/RefList$Builder;
.super Ljava/lang/Object;
.source "RefList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/util/RefList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lorg/eclipse/jgit/lib/Ref;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private list:[Lorg/eclipse/jgit/lib/Ref;

.field private size:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 330
    .local p0, this:Lorg/eclipse/jgit/util/RefList$Builder;,"Lorg/eclipse/jgit/util/RefList$Builder<TT;>;"
    const/16 v0, 0x10

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/util/RefList$Builder;-><init>(I)V

    .line 331
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .parameter "capacity"

    .prologue
    .line 339
    .local p0, this:Lorg/eclipse/jgit/util/RefList$Builder;,"Lorg/eclipse/jgit/util/RefList$Builder<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 340
    new-array v0, p1, [Lorg/eclipse/jgit/lib/Ref;

    iput-object v0, p0, Lorg/eclipse/jgit/util/RefList$Builder;->list:[Lorg/eclipse/jgit/lib/Ref;

    .line 341
    return-void
.end method


# virtual methods
.method public add(Lorg/eclipse/jgit/lib/Ref;)V
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .local p0, this:Lorg/eclipse/jgit/util/RefList$Builder;,"Lorg/eclipse/jgit/util/RefList$Builder<TT;>;"
    .local p1, ref:Lorg/eclipse/jgit/lib/Ref;,"TT;"
    const/4 v3, 0x0

    .line 380
    iget-object v1, p0, Lorg/eclipse/jgit/util/RefList$Builder;->list:[Lorg/eclipse/jgit/lib/Ref;

    array-length v1, v1

    iget v2, p0, Lorg/eclipse/jgit/util/RefList$Builder;->size:I

    if-ne v1, v2, :cond_0

    .line 381
    iget v1, p0, Lorg/eclipse/jgit/util/RefList$Builder;->size:I

    mul-int/lit8 v1, v1, 0x2

    new-array v0, v1, [Lorg/eclipse/jgit/lib/Ref;

    .line 382
    .local v0, n:[Lorg/eclipse/jgit/lib/Ref;
    iget-object v1, p0, Lorg/eclipse/jgit/util/RefList$Builder;->list:[Lorg/eclipse/jgit/lib/Ref;

    iget v2, p0, Lorg/eclipse/jgit/util/RefList$Builder;->size:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 383
    iput-object v0, p0, Lorg/eclipse/jgit/util/RefList$Builder;->list:[Lorg/eclipse/jgit/lib/Ref;

    .line 385
    .end local v0           #n:[Lorg/eclipse/jgit/lib/Ref;
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/util/RefList$Builder;->list:[Lorg/eclipse/jgit/lib/Ref;

    iget v2, p0, Lorg/eclipse/jgit/util/RefList$Builder;->size:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/eclipse/jgit/util/RefList$Builder;->size:I

    aput-object p1, v1, v2

    .line 386
    return-void
.end method

.method public addAll([Lorg/eclipse/jgit/lib/Ref;II)V
    .locals 4
    .parameter "src"
    .parameter "off"
    .parameter "cnt"

    .prologue
    .local p0, this:Lorg/eclipse/jgit/util/RefList$Builder;,"Lorg/eclipse/jgit/util/RefList$Builder<TT;>;"
    const/4 v3, 0x0

    .line 402
    iget-object v1, p0, Lorg/eclipse/jgit/util/RefList$Builder;->list:[Lorg/eclipse/jgit/lib/Ref;

    array-length v1, v1

    iget v2, p0, Lorg/eclipse/jgit/util/RefList$Builder;->size:I

    add-int/2addr v2, p3

    if-ge v1, v2, :cond_0

    .line 403
    iget v1, p0, Lorg/eclipse/jgit/util/RefList$Builder;->size:I

    mul-int/lit8 v1, v1, 0x2

    iget v2, p0, Lorg/eclipse/jgit/util/RefList$Builder;->size:I

    add-int/2addr v2, p3

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    new-array v0, v1, [Lorg/eclipse/jgit/lib/Ref;

    .line 404
    .local v0, n:[Lorg/eclipse/jgit/lib/Ref;
    iget-object v1, p0, Lorg/eclipse/jgit/util/RefList$Builder;->list:[Lorg/eclipse/jgit/lib/Ref;

    iget v2, p0, Lorg/eclipse/jgit/util/RefList$Builder;->size:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 405
    iput-object v0, p0, Lorg/eclipse/jgit/util/RefList$Builder;->list:[Lorg/eclipse/jgit/lib/Ref;

    .line 407
    .end local v0           #n:[Lorg/eclipse/jgit/lib/Ref;
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/util/RefList$Builder;->list:[Lorg/eclipse/jgit/lib/Ref;

    iget v2, p0, Lorg/eclipse/jgit/util/RefList$Builder;->size:I

    invoke-static {p1, p2, v1, v2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 408
    iget v1, p0, Lorg/eclipse/jgit/util/RefList$Builder;->size:I

    add-int/2addr v1, p3

    iput v1, p0, Lorg/eclipse/jgit/util/RefList$Builder;->size:I

    .line 409
    return-void
.end method

.method public get(I)Lorg/eclipse/jgit/lib/Ref;
    .locals 1
    .parameter "idx"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 357
    .local p0, this:Lorg/eclipse/jgit/util/RefList$Builder;,"Lorg/eclipse/jgit/util/RefList$Builder<TT;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/util/RefList$Builder;->list:[Lorg/eclipse/jgit/lib/Ref;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public remove(I)V
    .locals 5
    .parameter "idx"

    .prologue
    .line 367
    .local p0, this:Lorg/eclipse/jgit/util/RefList$Builder;,"Lorg/eclipse/jgit/util/RefList$Builder<TT;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/util/RefList$Builder;->list:[Lorg/eclipse/jgit/lib/Ref;

    add-int/lit8 v1, p1, 0x1

    iget-object v2, p0, Lorg/eclipse/jgit/util/RefList$Builder;->list:[Lorg/eclipse/jgit/lib/Ref;

    iget v3, p0, Lorg/eclipse/jgit/util/RefList$Builder;->size:I

    add-int/lit8 v4, p1, 0x1

    sub-int/2addr v3, v4

    invoke-static {v0, v1, v2, p1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 368
    iget v0, p0, Lorg/eclipse/jgit/util/RefList$Builder;->size:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/eclipse/jgit/util/RefList$Builder;->size:I

    .line 369
    return-void
.end method

.method public set(ILorg/eclipse/jgit/lib/Ref;)V
    .locals 1
    .parameter "idx"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    .prologue
    .line 420
    .local p0, this:Lorg/eclipse/jgit/util/RefList$Builder;,"Lorg/eclipse/jgit/util/RefList$Builder<TT;>;"
    .local p2, ref:Lorg/eclipse/jgit/lib/Ref;,"TT;"
    iget-object v0, p0, Lorg/eclipse/jgit/util/RefList$Builder;->list:[Lorg/eclipse/jgit/lib/Ref;

    aput-object p2, v0, p1

    .line 421
    return-void
.end method

.method public size()I
    .locals 1

    .prologue
    .line 345
    .local p0, this:Lorg/eclipse/jgit/util/RefList$Builder;,"Lorg/eclipse/jgit/util/RefList$Builder<TT;>;"
    iget v0, p0, Lorg/eclipse/jgit/util/RefList$Builder;->size:I

    return v0
.end method

.method public sort()V
    .locals 4

    .prologue
    .line 425
    .local p0, this:Lorg/eclipse/jgit/util/RefList$Builder;,"Lorg/eclipse/jgit/util/RefList$Builder<TT;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/util/RefList$Builder;->list:[Lorg/eclipse/jgit/lib/Ref;

    const/4 v1, 0x0

    iget v2, p0, Lorg/eclipse/jgit/util/RefList$Builder;->size:I

    sget-object v3, Lorg/eclipse/jgit/lib/RefComparator;->INSTANCE:Lorg/eclipse/jgit/lib/RefComparator;

    invoke-static {v0, v1, v2, v3}, Ljava/util/Arrays;->sort([Ljava/lang/Object;IILjava/util/Comparator;)V

    .line 426
    return-void
.end method

.method public toRefList()Lorg/eclipse/jgit/util/RefList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/eclipse/jgit/util/RefList",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 430
    .local p0, this:Lorg/eclipse/jgit/util/RefList$Builder;,"Lorg/eclipse/jgit/util/RefList$Builder<TT;>;"
    new-instance v0, Lorg/eclipse/jgit/util/RefList;

    iget-object v1, p0, Lorg/eclipse/jgit/util/RefList$Builder;->list:[Lorg/eclipse/jgit/lib/Ref;

    iget v2, p0, Lorg/eclipse/jgit/util/RefList$Builder;->size:I

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/util/RefList;-><init>([Lorg/eclipse/jgit/lib/Ref;I)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 435
    .local p0, this:Lorg/eclipse/jgit/util/RefList$Builder;,"Lorg/eclipse/jgit/util/RefList$Builder<TT;>;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/RefList$Builder;->toRefList()Lorg/eclipse/jgit/util/RefList;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/RefList;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
