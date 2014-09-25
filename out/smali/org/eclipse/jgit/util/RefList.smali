.class public Lorg/eclipse/jgit/util/RefList;
.super Ljava/lang/Object;
.source "RefList.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/util/RefList$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lorg/eclipse/jgit/lib/Ref;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<",
        "Lorg/eclipse/jgit/lib/Ref;",
        ">;"
    }
.end annotation


# static fields
.field private static final EMPTY:Lorg/eclipse/jgit/util/RefList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/util/RefList",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final cnt:I

.field private final list:[Lorg/eclipse/jgit/lib/Ref;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 71
    new-instance v0, Lorg/eclipse/jgit/util/RefList;

    new-array v1, v2, [Lorg/eclipse/jgit/lib/Ref;

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/util/RefList;-><init>([Lorg/eclipse/jgit/lib/Ref;I)V

    sput-object v0, Lorg/eclipse/jgit/util/RefList;->EMPTY:Lorg/eclipse/jgit/util/RefList;

    return-void
.end method

.method protected constructor <init>(Lorg/eclipse/jgit/util/RefList;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/util/RefList",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 98
    .local p0, this:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<TT;>;"
    .local p1, src:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    iget-object v0, p1, Lorg/eclipse/jgit/util/RefList;->list:[Lorg/eclipse/jgit/lib/Ref;

    iput-object v0, p0, Lorg/eclipse/jgit/util/RefList;->list:[Lorg/eclipse/jgit/lib/Ref;

    .line 100
    iget v0, p1, Lorg/eclipse/jgit/util/RefList;->cnt:I

    iput v0, p0, Lorg/eclipse/jgit/util/RefList;->cnt:I

    .line 101
    return-void
.end method

.method constructor <init>([Lorg/eclipse/jgit/lib/Ref;I)V
    .locals 0
    .parameter "list"
    .parameter "cnt"

    .prologue
    .line 87
    .local p0, this:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    iput-object p1, p0, Lorg/eclipse/jgit/util/RefList;->list:[Lorg/eclipse/jgit/lib/Ref;

    .line 89
    iput p2, p0, Lorg/eclipse/jgit/util/RefList;->cnt:I

    .line 90
    return-void
.end method

.method static synthetic access$000(Lorg/eclipse/jgit/util/RefList;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 70
    iget v0, p0, Lorg/eclipse/jgit/util/RefList;->cnt:I

    return v0
.end method

.method static synthetic access$100(Lorg/eclipse/jgit/util/RefList;)[Lorg/eclipse/jgit/lib/Ref;
    .locals 1
    .parameter "x0"

    .prologue
    .line 70
    iget-object v0, p0, Lorg/eclipse/jgit/util/RefList;->list:[Lorg/eclipse/jgit/lib/Ref;

    return-object v0
.end method

.method public static emptyList()Lorg/eclipse/jgit/util/RefList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">()",
            "Lorg/eclipse/jgit/util/RefList",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 80
    sget-object v0, Lorg/eclipse/jgit/util/RefList;->EMPTY:Lorg/eclipse/jgit/util/RefList;

    return-object v0
.end method


# virtual methods
.method public final add(ILorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/util/RefList;
    .locals 4
    .parameter "idx"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)",
            "Lorg/eclipse/jgit/util/RefList",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .local p0, this:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<TT;>;"
    .local p2, ref:Lorg/eclipse/jgit/lib/Ref;,"TT;"
    const/4 v2, 0x0

    .line 251
    if-gez p1, :cond_0

    .line 252
    add-int/lit8 v1, p1, 0x1

    neg-int p1, v1

    .line 254
    :cond_0
    iget v1, p0, Lorg/eclipse/jgit/util/RefList;->cnt:I

    add-int/lit8 v1, v1, 0x1

    new-array v0, v1, [Lorg/eclipse/jgit/lib/Ref;

    .line 255
    .local v0, newList:[Lorg/eclipse/jgit/lib/Ref;
    if-lez p1, :cond_1

    .line 256
    iget-object v1, p0, Lorg/eclipse/jgit/util/RefList;->list:[Lorg/eclipse/jgit/lib/Ref;

    invoke-static {v1, v2, v0, v2, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 257
    :cond_1
    aput-object p2, v0, p1

    .line 258
    iget v1, p0, Lorg/eclipse/jgit/util/RefList;->cnt:I

    if-ge p1, v1, :cond_2

    .line 259
    iget-object v1, p0, Lorg/eclipse/jgit/util/RefList;->list:[Lorg/eclipse/jgit/lib/Ref;

    add-int/lit8 v2, p1, 0x1

    iget v3, p0, Lorg/eclipse/jgit/util/RefList;->cnt:I

    sub-int/2addr v3, p1

    invoke-static {v1, p1, v0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 260
    :cond_2
    new-instance v1, Lorg/eclipse/jgit/util/RefList;

    iget v2, p0, Lorg/eclipse/jgit/util/RefList;->cnt:I

    add-int/lit8 v2, v2, 0x1

    invoke-direct {v1, v0, v2}, Lorg/eclipse/jgit/util/RefList;-><init>([Lorg/eclipse/jgit/lib/Ref;I)V

    return-object v1
.end method

.method public final asList()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .prologue
    .line 125
    .local p0, this:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<TT;>;"
    iget-object v1, p0, Lorg/eclipse/jgit/util/RefList;->list:[Lorg/eclipse/jgit/lib/Ref;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x0

    iget v3, p0, Lorg/eclipse/jgit/util/RefList;->cnt:I

    invoke-interface {v1, v2, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    .line 126
    .local v0, r:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public final contains(Ljava/lang/String;)Z
    .locals 1
    .parameter "name"

    .prologue
    .line 174
    .local p0, this:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<TT;>;"
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/util/RefList;->find(Ljava/lang/String;)I

    move-result v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final copy(I)Lorg/eclipse/jgit/util/RefList$Builder;
    .locals 3
    .parameter "n"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lorg/eclipse/jgit/util/RefList$Builder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 212
    .local p0, this:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<TT;>;"
    new-instance v0, Lorg/eclipse/jgit/util/RefList$Builder;

    const/16 v1, 0x10

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/util/RefList$Builder;-><init>(I)V

    .line 213
    .local v0, r:Lorg/eclipse/jgit/util/RefList$Builder;,"Lorg/eclipse/jgit/util/RefList$Builder<TT;>;"
    iget-object v1, p0, Lorg/eclipse/jgit/util/RefList;->list:[Lorg/eclipse/jgit/lib/Ref;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p1}, Lorg/eclipse/jgit/util/RefList$Builder;->addAll([Lorg/eclipse/jgit/lib/Ref;II)V

    .line 214
    return-object v0
.end method

.method public final find(Ljava/lang/String;)I
    .locals 5
    .parameter "name"

    .prologue
    .line 149
    .local p0, this:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<TT;>;"
    iget v1, p0, Lorg/eclipse/jgit/util/RefList;->cnt:I

    .line 150
    .local v1, high:I
    if-nez v1, :cond_1

    .line 151
    const/4 v3, -0x1

    .line 163
    :cond_0
    :goto_0
    return v3

    .line 152
    :cond_1
    const/4 v2, 0x0

    .line 154
    .local v2, low:I
    :cond_2
    add-int v4, v2, v1

    ushr-int/lit8 v3, v4, 0x1

    .line 155
    .local v3, mid:I
    iget-object v4, p0, Lorg/eclipse/jgit/util/RefList;->list:[Lorg/eclipse/jgit/lib/Ref;

    aget-object v4, v4, v3

    invoke-static {v4, p1}, Lorg/eclipse/jgit/lib/RefComparator;->compareTo(Lorg/eclipse/jgit/lib/Ref;Ljava/lang/String;)I

    move-result v0

    .line 156
    .local v0, cmp:I
    if-gez v0, :cond_3

    .line 157
    add-int/lit8 v2, v3, 0x1

    .line 162
    :goto_1
    if-lt v2, v1, :cond_2

    .line 163
    add-int/lit8 v4, v2, 0x1

    neg-int v3, v4

    goto :goto_0

    .line 158
    :cond_3
    if-eqz v0, :cond_0

    .line 161
    move v1, v3

    goto :goto_1
.end method

.method public final get(I)Lorg/eclipse/jgit/lib/Ref;
    .locals 1
    .parameter "idx"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 198
    .local p0, this:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<TT;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/util/RefList;->list:[Lorg/eclipse/jgit/lib/Ref;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public final get(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;
    .locals 2
    .parameter "name"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 185
    .local p0, this:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<TT;>;"
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/util/RefList;->find(Ljava/lang/String;)I

    move-result v0

    .line 186
    .local v0, idx:I
    if-ltz v0, :cond_0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/util/RefList;->get(I)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public final isEmpty()Z
    .locals 1

    .prologue
    .line 136
    .local p0, this:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<TT;>;"
    iget v0, p0, Lorg/eclipse/jgit/util/RefList;->cnt:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .prologue
    .line 104
    .local p0, this:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<TT;>;"
    new-instance v0, Lorg/eclipse/jgit/util/RefList$1;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/util/RefList$1;-><init>(Lorg/eclipse/jgit/util/RefList;)V

    return-object v0
.end method

.method public final put(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/util/RefList;
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lorg/eclipse/jgit/util/RefList",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 296
    .local p0, this:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<TT;>;"
    .local p1, ref:Lorg/eclipse/jgit/lib/Ref;,"TT;"
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/util/RefList;->find(Ljava/lang/String;)I

    move-result v0

    .line 297
    .local v0, idx:I
    if-ltz v0, :cond_0

    .line 298
    invoke-virtual {p0, v0, p1}, Lorg/eclipse/jgit/util/RefList;->set(ILorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/util/RefList;

    move-result-object v1

    .line 299
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {p0, v0, p1}, Lorg/eclipse/jgit/util/RefList;->add(ILorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/util/RefList;

    move-result-object v1

    goto :goto_0
.end method

.method public final remove(I)Lorg/eclipse/jgit/util/RefList;
    .locals 5
    .parameter "idx"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lorg/eclipse/jgit/util/RefList",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .local p0, this:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<TT;>;"
    const/4 v3, 0x0

    .line 274
    iget v1, p0, Lorg/eclipse/jgit/util/RefList;->cnt:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 275
    invoke-static {}, Lorg/eclipse/jgit/util/RefList;->emptyList()Lorg/eclipse/jgit/util/RefList;

    move-result-object v1

    .line 281
    :goto_0
    return-object v1

    .line 276
    :cond_0
    iget v1, p0, Lorg/eclipse/jgit/util/RefList;->cnt:I

    add-int/lit8 v1, v1, -0x1

    new-array v0, v1, [Lorg/eclipse/jgit/lib/Ref;

    .line 277
    .local v0, newList:[Lorg/eclipse/jgit/lib/Ref;
    if-lez p1, :cond_1

    .line 278
    iget-object v1, p0, Lorg/eclipse/jgit/util/RefList;->list:[Lorg/eclipse/jgit/lib/Ref;

    invoke-static {v1, v3, v0, v3, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 279
    :cond_1
    add-int/lit8 v1, p1, 0x1

    iget v2, p0, Lorg/eclipse/jgit/util/RefList;->cnt:I

    if-ge v1, v2, :cond_2

    .line 280
    iget-object v1, p0, Lorg/eclipse/jgit/util/RefList;->list:[Lorg/eclipse/jgit/lib/Ref;

    add-int/lit8 v2, p1, 0x1

    iget v3, p0, Lorg/eclipse/jgit/util/RefList;->cnt:I

    add-int/lit8 v4, p1, 0x1

    sub-int/2addr v3, v4

    invoke-static {v1, v2, v0, p1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 281
    :cond_2
    new-instance v1, Lorg/eclipse/jgit/util/RefList;

    iget v2, p0, Lorg/eclipse/jgit/util/RefList;->cnt:I

    add-int/lit8 v2, v2, -0x1

    invoke-direct {v1, v0, v2}, Lorg/eclipse/jgit/util/RefList;-><init>([Lorg/eclipse/jgit/lib/Ref;I)V

    goto :goto_0
.end method

.method public final set(ILorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/util/RefList;
    .locals 4
    .parameter "idx"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)",
            "Lorg/eclipse/jgit/util/RefList",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .local p0, this:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<TT;>;"
    .local p2, ref:Lorg/eclipse/jgit/lib/Ref;,"TT;"
    const/4 v3, 0x0

    .line 230
    iget v1, p0, Lorg/eclipse/jgit/util/RefList;->cnt:I

    new-array v0, v1, [Lorg/eclipse/jgit/lib/Ref;

    .line 231
    .local v0, newList:[Lorg/eclipse/jgit/lib/Ref;
    iget-object v1, p0, Lorg/eclipse/jgit/util/RefList;->list:[Lorg/eclipse/jgit/lib/Ref;

    iget v2, p0, Lorg/eclipse/jgit/util/RefList;->cnt:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 232
    aput-object p2, v0, p1

    .line 233
    new-instance v1, Lorg/eclipse/jgit/util/RefList;

    iget v2, p0, Lorg/eclipse/jgit/util/RefList;->cnt:I

    invoke-direct {v1, v0, v2}, Lorg/eclipse/jgit/util/RefList;-><init>([Lorg/eclipse/jgit/lib/Ref;I)V

    return-object v1
.end method

.method public final size()I
    .locals 1

    .prologue
    .line 131
    .local p0, this:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<TT;>;"
    iget v0, p0, Lorg/eclipse/jgit/util/RefList;->cnt:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 304
    .local p0, this:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<TT;>;"
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 305
    .local v1, r:Ljava/lang/StringBuilder;
    const/16 v2, 0x5b

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 306
    iget v2, p0, Lorg/eclipse/jgit/util/RefList;->cnt:I

    if-lez v2, :cond_0

    .line 307
    iget-object v2, p0, Lorg/eclipse/jgit/util/RefList;->list:[Lorg/eclipse/jgit/lib/Ref;

    const/4 v3, 0x0

    aget-object v2, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 308
    const/4 v0, 0x1

    .local v0, i:I
    :goto_0
    iget v2, p0, Lorg/eclipse/jgit/util/RefList;->cnt:I

    if-ge v0, v2, :cond_0

    .line 309
    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 310
    iget-object v2, p0, Lorg/eclipse/jgit/util/RefList;->list:[Lorg/eclipse/jgit/lib/Ref;

    aget-object v2, v2, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 308
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 313
    .end local v0           #i:I
    :cond_0
    const/16 v2, 0x5d

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 314
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
