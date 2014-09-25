.class final Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;
.super Ljava/lang/Object;
.source "DeltaTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Block"
.end annotation


# static fields
.field private static final MIN_TOP_PATH:I = 0x3200000


# instance fields
.field final beginIndex:I

.field private bytesPerUnit:J

.field final config:Lorg/eclipse/jgit/storage/pack/PackConfig;

.field final dc:Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;

.field final endIndex:I

.field final list:[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

.field final pm:Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;

.field final tasks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;",
            ">;"
        }
    .end annotation
.end field

.field final templateReader:Lorg/eclipse/jgit/lib/ObjectReader;

.field final threads:I

.field private totalWeight:J


# direct methods
.method constructor <init>(ILorg/eclipse/jgit/storage/pack/PackConfig;Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;II)V
    .locals 1
    .parameter "threads"
    .parameter "config"
    .parameter "reader"
    .parameter "dc"
    .parameter "pm"
    .parameter "list"
    .parameter "begin"
    .parameter "end"

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->tasks:Ljava/util/List;

    .line 82
    iput p1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->threads:I

    .line 83
    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;

    .line 84
    iput-object p3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->templateReader:Lorg/eclipse/jgit/lib/ObjectReader;

    .line 85
    iput-object p4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->dc:Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;

    .line 86
    iput-object p5, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->pm:Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;

    .line 87
    iput-object p6, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->list:[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    .line 88
    iput p7, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->beginIndex:I

    .line 89
    iput p8, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->endIndex:I

    .line 90
    return-void
.end method

.method static synthetic access$100(Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;)J
    .locals 2
    .parameter "x0"

    .prologue
    .line 62
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->bytesPerUnit:J

    return-wide v0
.end method

.method private computeTopPaths()Ljava/util/ArrayList;
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v13, 0x0

    .line 173
    new-instance v8, Ljava/util/ArrayList;

    iget v9, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->threads:I

    invoke-direct {v8, v9}, Ljava/util/ArrayList;-><init>(I)V

    .line 175
    .local v8, topPaths:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;>;"
    iget v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->beginIndex:I

    .line 176
    .local v1, cp:I
    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->list:[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    aget-object v9, v9, v1

    invoke-virtual {v9}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getPathHash()I

    move-result v0

    .line 177
    .local v0, ch:I
    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->list:[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    aget-object v9, v9, v1

    invoke-virtual {v9}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getWeight()I

    move-result v9

    int-to-long v2, v9

    .line 178
    .local v2, cw:J
    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->list:[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    aget-object v9, v9, v1

    invoke-virtual {v9}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getWeight()I

    move-result v9

    int-to-long v9, v9

    iput-wide v9, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->totalWeight:J

    .line 180
    add-int/lit8 v4, v1, 0x1

    .local v4, i:I
    :goto_0
    iget v9, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->endIndex:I

    if-ge v4, v9, :cond_5

    .line 181
    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->list:[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    aget-object v5, v9, v4

    .line 182
    .local v5, o:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getPathHash()I

    move-result v9

    if-eq v0, v9, :cond_1

    .line 183
    const-wide/32 v9, 0x3200000

    cmp-long v9, v9, v2

    if-gez v9, :cond_0

    .line 184
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v9

    iget v10, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->threads:I

    if-ge v9, v10, :cond_3

    .line 185
    new-instance v7, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;

    invoke-direct {v7, v1, v4}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;-><init>(II)V

    .line 186
    .local v7, s:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;
    new-instance v9, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;

    invoke-direct {v9, v2, v3, v7}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;-><init>(JLorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;)V

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 187
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v9

    iget v10, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->threads:I

    if-ne v9, v10, :cond_0

    .line 188
    invoke-static {v8}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 197
    .end local v7           #s:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;
    :cond_0
    :goto_1
    move v1, v4

    .line 198
    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getPathHash()I

    move-result v0

    .line 199
    const-wide/16 v2, 0x0

    .line 201
    :cond_1
    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isEdge()Z

    move-result v9

    if-nez v9, :cond_2

    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->doNotAttemptDelta()Z

    move-result v9

    if-eqz v9, :cond_4

    .line 180
    :cond_2
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 189
    :cond_3
    invoke-virtual {v8, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;

    iget-wide v9, v9, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;->weight:J

    cmp-long v9, v9, v2

    if-gez v9, :cond_0

    .line 190
    new-instance v7, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;

    invoke-direct {v7, v1, v4}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;-><init>(II)V

    .line 191
    .restart local v7       #s:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;
    new-instance v6, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;

    invoke-direct {v6, v2, v3, v7}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;-><init>(JLorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;)V

    .line 192
    .local v6, p:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;
    invoke-virtual {v8, v13, v6}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 193
    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;

    invoke-virtual {v6, v9}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;->compareTo(Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;)I

    move-result v9

    if-lez v9, :cond_0

    .line 194
    invoke-static {v8}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    goto :goto_1

    .line 203
    .end local v6           #p:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;
    .end local v7           #s:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;
    :cond_4
    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getWeight()I

    move-result v9

    int-to-long v9, v9

    add-long/2addr v2, v9

    .line 204
    iget-wide v9, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->totalWeight:J

    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getWeight()I

    move-result v11

    int-to-long v11, v11

    add-long/2addr v9, v11

    iput-wide v9, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->totalWeight:J

    goto :goto_2

    .line 208
    .end local v5           #o:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    :cond_5
    new-instance v9, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block$1;

    invoke-direct {v9, p0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block$1;-><init>(Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;)V

    invoke-static {v8, v9}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 214
    const-wide/16 v9, 0x1

    iput-wide v9, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->bytesPerUnit:J

    .line 215
    :goto_3
    const-wide/32 v9, 0x900000

    iget-wide v11, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->totalWeight:J

    iget-wide v13, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->bytesPerUnit:J

    div-long/2addr v11, v13

    cmp-long v9, v9, v11

    if-gtz v9, :cond_6

    .line 216
    iget-wide v9, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->bytesPerUnit:J

    const/16 v11, 0xa

    shl-long/2addr v9, v11

    iput-wide v9, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->bytesPerUnit:J

    goto :goto_3

    .line 217
    :cond_6
    return-object v8
.end method


# virtual methods
.method cost()I
    .locals 5

    .prologue
    .line 93
    iget-wide v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->totalWeight:J

    iget-wide v3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->bytesPerUnit:J

    div-long/2addr v1, v3

    long-to-int v0, v1

    .line 94
    .local v0, d:I
    iget-wide v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->totalWeight:J

    iget-wide v3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->bytesPerUnit:J

    rem-long/2addr v1, v3

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    .line 95
    add-int/lit8 v0, v0, 0x1

    .line 96
    :cond_0
    return v0
.end method

.method partitionTasks()V
    .locals 20

    .prologue
    .line 121
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->computeTopPaths()Ljava/util/ArrayList;

    move-result-object v11

    .line 122
    .local v11, topPaths:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;>;"
    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .line 123
    .local v10, topPathItr:Ljava/util/Iterator;,"Ljava/util/Iterator<Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;>;"
    const/4 v5, 0x0

    .line 124
    .local v5, nextTop:I
    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->totalWeight:J

    move-wide/from16 v16, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->threads:I

    move/from16 v18, v0

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v18, v0

    div-long v14, v16, v18

    .line 125
    .local v14, weightPerThread:J
    move-object/from16 v0, p0

    iget v3, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->beginIndex:I

    .local v3, i:I
    :goto_0
    move-object/from16 v0, p0

    iget v0, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->endIndex:I

    move/from16 v16, v0

    move/from16 v0, v16

    if-ge v3, v0, :cond_6

    .line 126
    new-instance v9, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;

    move-object/from16 v0, p0

    invoke-direct {v9, v0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;-><init>(Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;)V

    .line 127
    .local v9, task:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;
    const-wide/16 v12, 0x0

    .line 130
    .local v12, w:J
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_0

    .line 131
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;

    .line 132
    .local v7, p:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;
    iget-wide v0, v7, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;->weight:J

    move-wide/from16 v16, v0

    add-long v12, v12, v16

    .line 133
    iget-object v0, v7, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;->slice:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v9, v0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->add(Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;)V

    .line 137
    .end local v7           #p:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;
    :cond_0
    move v8, v3

    .local v8, s:I
    move v4, v3

    .end local v3           #i:I
    .local v4, i:I
    move v6, v5

    .line 138
    .end local v5           #nextTop:I
    .local v6, nextTop:I
    :goto_1
    cmp-long v16, v12, v14

    if-gez v16, :cond_3

    move-object/from16 v0, p0

    iget v0, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->endIndex:I

    move/from16 v16, v0

    move/from16 v0, v16

    if-ge v4, v0, :cond_3

    .line 139
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v16

    move/from16 v0, v16

    if-ge v6, v0, :cond_2

    invoke-virtual {v11, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;

    move-object/from16 v0, v16

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;->slice:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget v0, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;->beginIndex:I

    move/from16 v16, v0

    move/from16 v0, v16

    if-ne v4, v0, :cond_2

    .line 141
    if-ge v8, v4, :cond_1

    .line 142
    new-instance v16, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;

    move-object/from16 v0, v16

    invoke-direct {v0, v8, v4}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;-><init>(II)V

    move-object/from16 v0, v16

    invoke-virtual {v9, v0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->add(Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;)V

    .line 143
    :cond_1
    add-int/lit8 v5, v6, 0x1

    .end local v6           #nextTop:I
    .restart local v5       #nextTop:I
    invoke-virtual {v11, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;

    move-object/from16 v0, v16

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;->slice:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget v3, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;->endIndex:I

    .end local v4           #i:I
    .restart local v3       #i:I
    move v8, v3

    move v4, v3

    .end local v3           #i:I
    .restart local v4       #i:I
    move v6, v5

    .end local v5           #nextTop:I
    .restart local v6       #nextTop:I
    goto :goto_1

    .line 145
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->list:[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    move-object/from16 v16, v0

    add-int/lit8 v3, v4, 0x1

    .end local v4           #i:I
    .restart local v3       #i:I
    aget-object v16, v16, v4

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getWeight()I

    move-result v16

    move/from16 v0, v16

    int-to-long v0, v0

    move-wide/from16 v16, v0

    add-long v12, v12, v16

    move v4, v3

    .end local v3           #i:I
    .restart local v4       #i:I
    goto :goto_1

    .line 149
    :cond_3
    if-ge v8, v4, :cond_8

    .line 150
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->list:[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    move-object/from16 v16, v0

    add-int/lit8 v17, v4, -0x1

    aget-object v16, v16, v17

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getPathHash()I

    move-result v2

    .local v2, h:I
    move v3, v4

    .line 151
    .end local v4           #i:I
    .restart local v3       #i:I
    :goto_2
    move-object/from16 v0, p0

    iget v0, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->endIndex:I

    move/from16 v16, v0

    move/from16 v0, v16

    if-ge v3, v0, :cond_4

    .line 152
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->list:[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    move-object/from16 v16, v0

    aget-object v16, v16, v3

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getPathHash()I

    move-result v16

    move/from16 v0, v16

    if-ne v2, v0, :cond_4

    .line 153
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 157
    :cond_4
    new-instance v16, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;

    move-object/from16 v0, v16

    invoke-direct {v0, v8, v3}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;-><init>(II)V

    move-object/from16 v0, v16

    invoke-virtual {v9, v0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->add(Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;)V

    .line 159
    .end local v2           #h:I
    :goto_3
    #getter for: Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->slices:Ljava/util/LinkedList;
    invoke-static {v9}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->access$000(Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;)Ljava/util/LinkedList;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v16

    if-nez v16, :cond_5

    .line 160
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->tasks:Ljava/util/List;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_5
    move v5, v6

    .line 161
    .end local v6           #nextTop:I
    .restart local v5       #nextTop:I
    goto/16 :goto_0

    .line 162
    .end local v8           #s:I
    .end local v9           #task:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;
    .end local v12           #w:J
    :cond_6
    :goto_4
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_7

    .line 163
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;

    .line 164
    .restart local v7       #p:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;
    new-instance v9, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;

    move-object/from16 v0, p0

    invoke-direct {v9, v0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;-><init>(Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;)V

    .line 165
    .restart local v9       #task:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;
    iget-object v0, v7, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;->slice:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v9, v0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->add(Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;)V

    .line 166
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->tasks:Ljava/util/List;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 169
    .end local v7           #p:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;
    .end local v9           #task:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;
    :cond_7
    const/4 v11, 0x0

    .line 170
    return-void

    .end local v3           #i:I
    .end local v5           #nextTop:I
    .restart local v4       #i:I
    .restart local v6       #nextTop:I
    .restart local v8       #s:I
    .restart local v9       #task:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;
    .restart local v12       #w:J
    :cond_8
    move v3, v4

    .end local v4           #i:I
    .restart local v3       #i:I
    goto :goto_3
.end method

.method declared-synchronized stealWork(Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;)Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;
    .locals 7
    .parameter "forThread"

    .prologue
    .line 101
    monitor-enter p0

    :cond_0
    const/4 v2, 0x0

    .line 102
    .local v2, maxTask:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;
    const/4 v1, 0x0

    .line 103
    .local v1, maxSlice:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;
    const/4 v3, 0x0

    .line 105
    .local v3, maxWork:I
    :try_start_0
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->tasks:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;

    .line 106
    .local v5, task:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;
    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->remaining()Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;

    move-result-object v4

    .line 107
    .local v4, s:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;
    if-eqz v4, :cond_1

    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;->size()I

    move-result v6

    if-ge v3, v6, :cond_1

    .line 108
    move-object v2, v5

    .line 109
    move-object v1, v4

    .line 110
    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    goto :goto_0

    .line 113
    .end local v4           #s:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;
    .end local v5           #task:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;
    :cond_2
    if-nez v2, :cond_3

    .line 114
    const/4 v6, 0x0

    .line 116
    :goto_1
    monitor-exit p0

    return-object v6

    .line 115
    :cond_3
    :try_start_1
    invoke-virtual {v2, v1}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->tryStealWork(Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 116
    invoke-virtual {p1, v1}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->initWindow(Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;)Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v6

    goto :goto_1

    .line 101
    .end local v0           #i$:Ljava/util/Iterator;
    :catchall_0
    move-exception v6

    monitor-exit p0

    throw v6
.end method
