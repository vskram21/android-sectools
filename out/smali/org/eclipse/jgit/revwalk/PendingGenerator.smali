.class Lorg/eclipse/jgit/revwalk/PendingGenerator;
.super Lorg/eclipse/jgit/revwalk/Generator;
.source "PendingGenerator.java"


# static fields
.field private static final INIT_LAST:Lorg/eclipse/jgit/revwalk/RevCommit; = null

.field static final OVER_SCAN:I = 0x6

.field private static final PARSED:I = 0x1

.field private static final SEEN:I = 0x2

.field private static final UNINTERESTING:I = 0x4


# instance fields
.field canDispose:Z

.field private final filter:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

.field private last:Lorg/eclipse/jgit/revwalk/RevCommit;

.field private final output:I

.field private overScan:I

.field private final pending:Lorg/eclipse/jgit/revwalk/DateRevQueue;

.field private final walker:Lorg/eclipse/jgit/revwalk/RevWalk;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 85
    new-instance v0, Lorg/eclipse/jgit/revwalk/RevCommit;

    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/revwalk/RevCommit;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    sput-object v0, Lorg/eclipse/jgit/revwalk/PendingGenerator;->INIT_LAST:Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 86
    sget-object v0, Lorg/eclipse/jgit/revwalk/PendingGenerator;->INIT_LAST:Lorg/eclipse/jgit/revwalk/RevCommit;

    const v1, 0x7fffffff

    iput v1, v0, Lorg/eclipse/jgit/revwalk/RevCommit;->commitTime:I

    .line 87
    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/DateRevQueue;Lorg/eclipse/jgit/revwalk/filter/RevFilter;I)V
    .locals 1
    .parameter "w"
    .parameter "p"
    .parameter "f"
    .parameter "out"

    .prologue
    .line 111
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/Generator;-><init>()V

    .line 98
    sget-object v0, Lorg/eclipse/jgit/revwalk/PendingGenerator;->INIT_LAST:Lorg/eclipse/jgit/revwalk/RevCommit;

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/PendingGenerator;->last:Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 106
    const/4 v0, 0x6

    iput v0, p0, Lorg/eclipse/jgit/revwalk/PendingGenerator;->overScan:I

    .line 112
    iput-object p1, p0, Lorg/eclipse/jgit/revwalk/PendingGenerator;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    .line 113
    iput-object p2, p0, Lorg/eclipse/jgit/revwalk/PendingGenerator;->pending:Lorg/eclipse/jgit/revwalk/DateRevQueue;

    .line 114
    iput-object p3, p0, Lorg/eclipse/jgit/revwalk/PendingGenerator;->filter:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    .line 115
    iput p4, p0, Lorg/eclipse/jgit/revwalk/PendingGenerator;->output:I

    .line 116
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/revwalk/PendingGenerator;->canDispose:Z

    .line 117
    return-void
.end method


# virtual methods
.method next()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 129
    :cond_0
    :goto_0
    :try_start_0
    iget-object v9, p0, Lorg/eclipse/jgit/revwalk/PendingGenerator;->pending:Lorg/eclipse/jgit/revwalk/DateRevQueue;

    invoke-virtual {v9}, Lorg/eclipse/jgit/revwalk/DateRevQueue;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v1

    .line 130
    .local v1, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-nez v1, :cond_1

    .line 131
    iget-object v9, p0, Lorg/eclipse/jgit/revwalk/PendingGenerator;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v9, v9, Lorg/eclipse/jgit/revwalk/RevWalk;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v9}, Lorg/eclipse/jgit/lib/ObjectReader;->walkAdviceEnd()V

    move-object v1, v8

    .line 182
    .end local v1           #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    :goto_1
    return-object v1

    .line 136
    .restart local v1       #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_1
    iget v9, v1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/lit8 v9, v9, 0x4

    if-eqz v9, :cond_2

    .line 137
    const/4 v6, 0x0

    .line 144
    .local v6, produce:Z
    :goto_2
    iget-object v0, v1, Lorg/eclipse/jgit/revwalk/RevCommit;->parents:[Lorg/eclipse/jgit/revwalk/RevCommit;

    .local v0, arr$:[Lorg/eclipse/jgit/revwalk/RevCommit;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_3
    if-ge v2, v3, :cond_6

    aget-object v5, v0, v2

    .line 145
    .local v5, p:Lorg/eclipse/jgit/revwalk/RevCommit;
    iget v9, v5, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/lit8 v9, v9, 0x2

    if-eqz v9, :cond_4

    .line 144
    :goto_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 139
    .end local v0           #arr$:[Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v2           #i$:I
    .end local v3           #len$:I
    .end local v5           #p:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v6           #produce:Z
    :cond_2
    iget-object v9, p0, Lorg/eclipse/jgit/revwalk/PendingGenerator;->filter:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    invoke-virtual {v9}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->requiresCommitBody()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 140
    iget-object v9, p0, Lorg/eclipse/jgit/revwalk/PendingGenerator;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v1, v9}, Lorg/eclipse/jgit/revwalk/RevCommit;->parseBody(Lorg/eclipse/jgit/revwalk/RevWalk;)V

    .line 141
    :cond_3
    iget-object v9, p0, Lorg/eclipse/jgit/revwalk/PendingGenerator;->filter:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    iget-object v10, p0, Lorg/eclipse/jgit/revwalk/PendingGenerator;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v9, v10, v1}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->include(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/RevCommit;)Z

    move-result v6

    .restart local v6       #produce:Z
    goto :goto_2

    .line 147
    .restart local v0       #arr$:[Lorg/eclipse/jgit/revwalk/RevCommit;
    .restart local v2       #i$:I
    .restart local v3       #len$:I
    .restart local v5       #p:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_4
    iget v9, v5, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/lit8 v9, v9, 0x1

    if-nez v9, :cond_5

    .line 148
    iget-object v9, p0, Lorg/eclipse/jgit/revwalk/PendingGenerator;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v5, v9}, Lorg/eclipse/jgit/revwalk/RevCommit;->parseHeaders(Lorg/eclipse/jgit/revwalk/RevWalk;)V

    .line 149
    :cond_5
    iget v9, v5, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    or-int/lit8 v9, v9, 0x2

    iput v9, v5, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    .line 150
    iget-object v9, p0, Lorg/eclipse/jgit/revwalk/PendingGenerator;->pending:Lorg/eclipse/jgit/revwalk/DateRevQueue;

    invoke-virtual {v9, v5}, Lorg/eclipse/jgit/revwalk/DateRevQueue;->add(Lorg/eclipse/jgit/revwalk/RevCommit;)V
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/StopWalkException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    .line 179
    .end local v0           #arr$:[Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v1           #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v2           #i$:I
    .end local v3           #len$:I
    .end local v5           #p:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v6           #produce:Z
    :catch_0
    move-exception v7

    .line 180
    .local v7, swe:Lorg/eclipse/jgit/errors/StopWalkException;
    iget-object v9, p0, Lorg/eclipse/jgit/revwalk/PendingGenerator;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v9, v9, Lorg/eclipse/jgit/revwalk/RevWalk;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v9}, Lorg/eclipse/jgit/lib/ObjectReader;->walkAdviceEnd()V

    .line 181
    iget-object v9, p0, Lorg/eclipse/jgit/revwalk/PendingGenerator;->pending:Lorg/eclipse/jgit/revwalk/DateRevQueue;

    invoke-virtual {v9}, Lorg/eclipse/jgit/revwalk/DateRevQueue;->clear()V

    move-object v1, v8

    .line 182
    goto :goto_1

    .line 152
    .end local v7           #swe:Lorg/eclipse/jgit/errors/StopWalkException;
    .restart local v0       #arr$:[Lorg/eclipse/jgit/revwalk/RevCommit;
    .restart local v1       #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    .restart local v2       #i$:I
    .restart local v3       #len$:I
    .restart local v6       #produce:Z
    :cond_6
    :try_start_1
    iget-object v9, p0, Lorg/eclipse/jgit/revwalk/PendingGenerator;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v9, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->carryFlagsImpl(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 154
    iget v9, v1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/lit8 v9, v9, 0x4

    if-eqz v9, :cond_a

    .line 155
    iget-object v9, p0, Lorg/eclipse/jgit/revwalk/PendingGenerator;->pending:Lorg/eclipse/jgit/revwalk/DateRevQueue;

    const/4 v10, 0x4

    invoke-virtual {v9, v10}, Lorg/eclipse/jgit/revwalk/DateRevQueue;->everbodyHasFlag(I)Z

    move-result v9

    if-eqz v9, :cond_9

    .line 156
    iget-object v9, p0, Lorg/eclipse/jgit/revwalk/PendingGenerator;->pending:Lorg/eclipse/jgit/revwalk/DateRevQueue;

    invoke-virtual {v9}, Lorg/eclipse/jgit/revwalk/DateRevQueue;->peek()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v4

    .line 157
    .local v4, n:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-eqz v4, :cond_8

    iget v9, v4, Lorg/eclipse/jgit/revwalk/RevCommit;->commitTime:I

    iget-object v10, p0, Lorg/eclipse/jgit/revwalk/PendingGenerator;->last:Lorg/eclipse/jgit/revwalk/RevCommit;

    iget v10, v10, Lorg/eclipse/jgit/revwalk/RevCommit;->commitTime:I

    if-lt v9, v10, :cond_8

    .line 163
    const/4 v9, 0x6

    iput v9, p0, Lorg/eclipse/jgit/revwalk/PendingGenerator;->overScan:I

    .line 169
    .end local v4           #n:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_7
    :goto_5
    iget-boolean v9, p0, Lorg/eclipse/jgit/revwalk/PendingGenerator;->canDispose:Z

    if-eqz v9, :cond_0

    .line 170
    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevCommit;->disposeBody()V

    goto/16 :goto_0

    .line 164
    .restart local v4       #n:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_8
    iget v9, p0, Lorg/eclipse/jgit/revwalk/PendingGenerator;->overScan:I

    add-int/lit8 v9, v9, -0x1

    iput v9, p0, Lorg/eclipse/jgit/revwalk/PendingGenerator;->overScan:I

    if-nez v9, :cond_7

    .line 165
    sget-object v9, Lorg/eclipse/jgit/errors/StopWalkException;->INSTANCE:Lorg/eclipse/jgit/errors/StopWalkException;

    throw v9

    .line 167
    .end local v4           #n:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_9
    const/4 v9, 0x6

    iput v9, p0, Lorg/eclipse/jgit/revwalk/PendingGenerator;->overScan:I

    goto :goto_5

    .line 174
    :cond_a
    if-eqz v6, :cond_b

    .line 175
    iput-object v1, p0, Lorg/eclipse/jgit/revwalk/PendingGenerator;->last:Lorg/eclipse/jgit/revwalk/RevCommit;

    goto/16 :goto_1

    .line 176
    :cond_b
    iget-boolean v9, p0, Lorg/eclipse/jgit/revwalk/PendingGenerator;->canDispose:Z

    if-eqz v9, :cond_0

    .line 177
    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevCommit;->disposeBody()V
    :try_end_1
    .catch Lorg/eclipse/jgit/errors/StopWalkException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method outputType()I
    .locals 1

    .prologue
    .line 121
    iget v0, p0, Lorg/eclipse/jgit/revwalk/PendingGenerator;->output:I

    or-int/lit8 v0, v0, 0x1

    return v0
.end method
