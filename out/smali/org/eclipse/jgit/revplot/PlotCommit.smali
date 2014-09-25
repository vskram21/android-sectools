.class public Lorg/eclipse/jgit/revplot/PlotCommit;
.super Lorg/eclipse/jgit/revwalk/RevCommit;
.source "PlotCommit.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<",
        "L:Lorg/eclipse/jgit/revplot/PlotLane;",
        ">",
        "Lorg/eclipse/jgit/revwalk/RevCommit;"
    }
.end annotation


# static fields
.field static final NO_CHILDREN:[Lorg/eclipse/jgit/revplot/PlotCommit;

.field static final NO_LANES:[Lorg/eclipse/jgit/revplot/PlotLane;

.field static final NO_REFS:[Lorg/eclipse/jgit/lib/Ref;


# instance fields
.field children:[Lorg/eclipse/jgit/revplot/PlotCommit;

.field forkingOffLanes:[Lorg/eclipse/jgit/revplot/PlotLane;

.field lane:Lorg/eclipse/jgit/revplot/PlotLane;

.field mergingLanes:[Lorg/eclipse/jgit/revplot/PlotLane;

.field passingLanes:[Lorg/eclipse/jgit/revplot/PlotLane;

.field refs:[Lorg/eclipse/jgit/lib/Ref;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 58
    new-array v0, v1, [Lorg/eclipse/jgit/revplot/PlotCommit;

    sput-object v0, Lorg/eclipse/jgit/revplot/PlotCommit;->NO_CHILDREN:[Lorg/eclipse/jgit/revplot/PlotCommit;

    .line 60
    new-array v0, v1, [Lorg/eclipse/jgit/revplot/PlotLane;

    sput-object v0, Lorg/eclipse/jgit/revplot/PlotCommit;->NO_LANES:[Lorg/eclipse/jgit/revplot/PlotLane;

    .line 62
    new-array v0, v1, [Lorg/eclipse/jgit/lib/Ref;

    sput-object v0, Lorg/eclipse/jgit/revplot/PlotCommit;->NO_REFS:[Lorg/eclipse/jgit/lib/Ref;

    return-void
.end method

.method protected constructor <init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 1
    .parameter "id"

    .prologue
    .line 83
    .local p0, this:Lorg/eclipse/jgit/revplot/PlotCommit;,"Lorg/eclipse/jgit/revplot/PlotCommit<TL;>;"
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/revwalk/RevCommit;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 84
    sget-object v0, Lorg/eclipse/jgit/revplot/PlotCommit;->NO_LANES:[Lorg/eclipse/jgit/revplot/PlotLane;

    iput-object v0, p0, Lorg/eclipse/jgit/revplot/PlotCommit;->forkingOffLanes:[Lorg/eclipse/jgit/revplot/PlotLane;

    .line 85
    sget-object v0, Lorg/eclipse/jgit/revplot/PlotCommit;->NO_LANES:[Lorg/eclipse/jgit/revplot/PlotLane;

    iput-object v0, p0, Lorg/eclipse/jgit/revplot/PlotCommit;->passingLanes:[Lorg/eclipse/jgit/revplot/PlotLane;

    .line 86
    sget-object v0, Lorg/eclipse/jgit/revplot/PlotCommit;->NO_LANES:[Lorg/eclipse/jgit/revplot/PlotLane;

    iput-object v0, p0, Lorg/eclipse/jgit/revplot/PlotCommit;->mergingLanes:[Lorg/eclipse/jgit/revplot/PlotLane;

    .line 87
    sget-object v0, Lorg/eclipse/jgit/revplot/PlotCommit;->NO_CHILDREN:[Lorg/eclipse/jgit/revplot/PlotCommit;

    iput-object v0, p0, Lorg/eclipse/jgit/revplot/PlotCommit;->children:[Lorg/eclipse/jgit/revplot/PlotCommit;

    .line 88
    sget-object v0, Lorg/eclipse/jgit/revplot/PlotCommit;->NO_REFS:[Lorg/eclipse/jgit/lib/Ref;

    iput-object v0, p0, Lorg/eclipse/jgit/revplot/PlotCommit;->refs:[Lorg/eclipse/jgit/lib/Ref;

    .line 89
    return-void
.end method

.method private static addLane(Lorg/eclipse/jgit/revplot/PlotLane;[Lorg/eclipse/jgit/revplot/PlotLane;)[Lorg/eclipse/jgit/revplot/PlotLane;
    .locals 6
    .parameter "l"
    .parameter "lanes"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 104
    array-length v0, p1

    .line 105
    .local v0, cnt:I
    if-nez v0, :cond_0

    .line 106
    new-array p1, v5, [Lorg/eclipse/jgit/revplot/PlotLane;

    .end local p1
    aput-object p0, p1, v4

    .line 115
    .restart local p1
    :goto_0
    return-object p1

    .line 107
    :cond_0
    if-ne v0, v5, :cond_1

    .line 108
    const/4 v3, 0x2

    new-array v1, v3, [Lorg/eclipse/jgit/revplot/PlotLane;

    aget-object v3, p1, v4

    aput-object v3, v1, v4

    aput-object p0, v1, v5

    .end local p1
    .local v1, lanes:[Lorg/eclipse/jgit/revplot/PlotLane;
    move-object p1, v1

    .end local v1           #lanes:[Lorg/eclipse/jgit/revplot/PlotLane;
    .restart local p1
    goto :goto_0

    .line 110
    :cond_1
    add-int/lit8 v3, v0, 0x1

    new-array v2, v3, [Lorg/eclipse/jgit/revplot/PlotLane;

    .line 111
    .local v2, n:[Lorg/eclipse/jgit/revplot/PlotLane;
    invoke-static {p1, v4, v2, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 112
    aput-object p0, v2, v0

    .line 113
    move-object p1, v2

    goto :goto_0
.end method


# virtual methods
.method addChild(Lorg/eclipse/jgit/revplot/PlotCommit;)V
    .locals 10
    .parameter "c"

    .prologue
    .local p0, this:Lorg/eclipse/jgit/revplot/PlotCommit;,"Lorg/eclipse/jgit/revplot/PlotCommit<TL;>;"
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 119
    iget-object v6, p0, Lorg/eclipse/jgit/revplot/PlotCommit;->children:[Lorg/eclipse/jgit/revplot/PlotCommit;

    array-length v1, v6

    .line 120
    .local v1, cnt:I
    if-nez v1, :cond_1

    .line 121
    new-array v6, v9, [Lorg/eclipse/jgit/revplot/PlotCommit;

    aput-object p1, v6, v8

    iput-object v6, p0, Lorg/eclipse/jgit/revplot/PlotCommit;->children:[Lorg/eclipse/jgit/revplot/PlotCommit;

    .line 134
    :cond_0
    :goto_0
    return-void

    .line 122
    :cond_1
    if-ne v1, v9, :cond_2

    .line 123
    invoke-virtual {p1}, Lorg/eclipse/jgit/revplot/PlotCommit;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    iget-object v7, p0, Lorg/eclipse/jgit/revplot/PlotCommit;->children:[Lorg/eclipse/jgit/revplot/PlotCommit;

    aget-object v7, v7, v8

    invoke-virtual {v7}, Lorg/eclipse/jgit/revplot/PlotCommit;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 124
    const/4 v6, 0x2

    new-array v6, v6, [Lorg/eclipse/jgit/revplot/PlotCommit;

    iget-object v7, p0, Lorg/eclipse/jgit/revplot/PlotCommit;->children:[Lorg/eclipse/jgit/revplot/PlotCommit;

    aget-object v7, v7, v8

    aput-object v7, v6, v8

    aput-object p1, v6, v9

    iput-object v6, p0, Lorg/eclipse/jgit/revplot/PlotCommit;->children:[Lorg/eclipse/jgit/revplot/PlotCommit;

    goto :goto_0

    .line 126
    :cond_2
    iget-object v0, p0, Lorg/eclipse/jgit/revplot/PlotCommit;->children:[Lorg/eclipse/jgit/revplot/PlotCommit;

    .local v0, arr$:[Lorg/eclipse/jgit/revplot/PlotCommit;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_1
    if-ge v2, v3, :cond_3

    aget-object v5, v0, v2

    .line 127
    .local v5, pc:Lorg/eclipse/jgit/revplot/PlotCommit;
    invoke-virtual {p1}, Lorg/eclipse/jgit/revplot/PlotCommit;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-virtual {v5}, Lorg/eclipse/jgit/revplot/PlotCommit;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 126
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 129
    .end local v5           #pc:Lorg/eclipse/jgit/revplot/PlotCommit;
    :cond_3
    add-int/lit8 v6, v1, 0x1

    new-array v4, v6, [Lorg/eclipse/jgit/revplot/PlotCommit;

    .line 130
    .local v4, n:[Lorg/eclipse/jgit/revplot/PlotCommit;
    iget-object v6, p0, Lorg/eclipse/jgit/revplot/PlotCommit;->children:[Lorg/eclipse/jgit/revplot/PlotCommit;

    invoke-static {v6, v8, v4, v8, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 131
    aput-object p1, v4, v1

    .line 132
    iput-object v4, p0, Lorg/eclipse/jgit/revplot/PlotCommit;->children:[Lorg/eclipse/jgit/revplot/PlotCommit;

    goto :goto_0
.end method

.method addForkingOffLane(Lorg/eclipse/jgit/revplot/PlotLane;)V
    .locals 1
    .parameter "f"

    .prologue
    .line 92
    .local p0, this:Lorg/eclipse/jgit/revplot/PlotCommit;,"Lorg/eclipse/jgit/revplot/PlotCommit<TL;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/revplot/PlotCommit;->forkingOffLanes:[Lorg/eclipse/jgit/revplot/PlotLane;

    invoke-static {p1, v0}, Lorg/eclipse/jgit/revplot/PlotCommit;->addLane(Lorg/eclipse/jgit/revplot/PlotLane;[Lorg/eclipse/jgit/revplot/PlotLane;)[Lorg/eclipse/jgit/revplot/PlotLane;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/revplot/PlotCommit;->forkingOffLanes:[Lorg/eclipse/jgit/revplot/PlotLane;

    .line 93
    return-void
.end method

.method addMergingLane(Lorg/eclipse/jgit/revplot/PlotLane;)V
    .locals 1
    .parameter "m"

    .prologue
    .line 100
    .local p0, this:Lorg/eclipse/jgit/revplot/PlotCommit;,"Lorg/eclipse/jgit/revplot/PlotCommit<TL;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/revplot/PlotCommit;->mergingLanes:[Lorg/eclipse/jgit/revplot/PlotLane;

    invoke-static {p1, v0}, Lorg/eclipse/jgit/revplot/PlotCommit;->addLane(Lorg/eclipse/jgit/revplot/PlotLane;[Lorg/eclipse/jgit/revplot/PlotLane;)[Lorg/eclipse/jgit/revplot/PlotLane;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/revplot/PlotCommit;->mergingLanes:[Lorg/eclipse/jgit/revplot/PlotLane;

    .line 101
    return-void
.end method

.method addPassingLane(Lorg/eclipse/jgit/revplot/PlotLane;)V
    .locals 1
    .parameter "c"

    .prologue
    .line 96
    .local p0, this:Lorg/eclipse/jgit/revplot/PlotCommit;,"Lorg/eclipse/jgit/revplot/PlotCommit<TL;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/revplot/PlotCommit;->passingLanes:[Lorg/eclipse/jgit/revplot/PlotLane;

    invoke-static {p1, v0}, Lorg/eclipse/jgit/revplot/PlotCommit;->addLane(Lorg/eclipse/jgit/revplot/PlotLane;[Lorg/eclipse/jgit/revplot/PlotLane;)[Lorg/eclipse/jgit/revplot/PlotLane;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/revplot/PlotCommit;->passingLanes:[Lorg/eclipse/jgit/revplot/PlotLane;

    .line 97
    return-void
.end method

.method public final getChild(I)Lorg/eclipse/jgit/revplot/PlotCommit;
    .locals 1
    .parameter "nth"

    .prologue
    .line 156
    .local p0, this:Lorg/eclipse/jgit/revplot/PlotCommit;,"Lorg/eclipse/jgit/revplot/PlotCommit<TL;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/revplot/PlotCommit;->children:[Lorg/eclipse/jgit/revplot/PlotCommit;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public final getChildCount()I
    .locals 1

    .prologue
    .line 142
    .local p0, this:Lorg/eclipse/jgit/revplot/PlotCommit;,"Lorg/eclipse/jgit/revplot/PlotCommit<TL;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/revplot/PlotCommit;->children:[Lorg/eclipse/jgit/revplot/PlotCommit;

    array-length v0, v0

    return v0
.end method

.method public final getLane()Lorg/eclipse/jgit/revplot/PlotLane;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()T",
            "L;"
        }
    .end annotation

    .prologue
    .line 202
    .local p0, this:Lorg/eclipse/jgit/revplot/PlotCommit;,"Lorg/eclipse/jgit/revplot/PlotCommit<TL;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/revplot/PlotCommit;->lane:Lorg/eclipse/jgit/revplot/PlotLane;

    return-object v0
.end method

.method public final getRef(I)Lorg/eclipse/jgit/lib/Ref;
    .locals 1
    .parameter "nth"

    .prologue
    .line 193
    .local p0, this:Lorg/eclipse/jgit/revplot/PlotCommit;,"Lorg/eclipse/jgit/revplot/PlotCommit<TL;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/revplot/PlotCommit;->refs:[Lorg/eclipse/jgit/lib/Ref;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public final getRefCount()I
    .locals 1

    .prologue
    .line 179
    .local p0, this:Lorg/eclipse/jgit/revplot/PlotCommit;,"Lorg/eclipse/jgit/revplot/PlotCommit<TL;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/revplot/PlotCommit;->refs:[Lorg/eclipse/jgit/lib/Ref;

    array-length v0, v0

    return v0
.end method

.method public final isChild(Lorg/eclipse/jgit/revplot/PlotCommit;)Z
    .locals 5
    .parameter "c"

    .prologue
    .line 167
    .local p0, this:Lorg/eclipse/jgit/revplot/PlotCommit;,"Lorg/eclipse/jgit/revplot/PlotCommit<TL;>;"
    iget-object v1, p0, Lorg/eclipse/jgit/revplot/PlotCommit;->children:[Lorg/eclipse/jgit/revplot/PlotCommit;

    .local v1, arr$:[Lorg/eclipse/jgit/revplot/PlotCommit;
    array-length v3, v1

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v0, v1, v2

    .line 168
    .local v0, a:Lorg/eclipse/jgit/revplot/PlotCommit;
    if-ne v0, p1, :cond_0

    .line 169
    const/4 v4, 0x1

    .line 170
    .end local v0           #a:Lorg/eclipse/jgit/revplot/PlotCommit;
    :goto_1
    return v4

    .line 167
    .restart local v0       #a:Lorg/eclipse/jgit/revplot/PlotCommit;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 170
    .end local v0           #a:Lorg/eclipse/jgit/revplot/PlotCommit;
    :cond_1
    const/4 v4, 0x0

    goto :goto_1
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 207
    .local p0, this:Lorg/eclipse/jgit/revplot/PlotCommit;,"Lorg/eclipse/jgit/revplot/PlotCommit<TL;>;"
    sget-object v0, Lorg/eclipse/jgit/revplot/PlotCommit;->NO_LANES:[Lorg/eclipse/jgit/revplot/PlotLane;

    iput-object v0, p0, Lorg/eclipse/jgit/revplot/PlotCommit;->forkingOffLanes:[Lorg/eclipse/jgit/revplot/PlotLane;

    .line 208
    sget-object v0, Lorg/eclipse/jgit/revplot/PlotCommit;->NO_LANES:[Lorg/eclipse/jgit/revplot/PlotLane;

    iput-object v0, p0, Lorg/eclipse/jgit/revplot/PlotCommit;->passingLanes:[Lorg/eclipse/jgit/revplot/PlotLane;

    .line 209
    sget-object v0, Lorg/eclipse/jgit/revplot/PlotCommit;->NO_LANES:[Lorg/eclipse/jgit/revplot/PlotLane;

    iput-object v0, p0, Lorg/eclipse/jgit/revplot/PlotCommit;->mergingLanes:[Lorg/eclipse/jgit/revplot/PlotLane;

    .line 210
    sget-object v0, Lorg/eclipse/jgit/revplot/PlotCommit;->NO_CHILDREN:[Lorg/eclipse/jgit/revplot/PlotCommit;

    iput-object v0, p0, Lorg/eclipse/jgit/revplot/PlotCommit;->children:[Lorg/eclipse/jgit/revplot/PlotCommit;

    .line 211
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/revplot/PlotCommit;->lane:Lorg/eclipse/jgit/revplot/PlotLane;

    .line 212
    invoke-super {p0}, Lorg/eclipse/jgit/revwalk/RevCommit;->reset()V

    .line 213
    return-void
.end method
