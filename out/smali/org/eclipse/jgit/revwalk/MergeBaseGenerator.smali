.class Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;
.super Lorg/eclipse/jgit/revwalk/Generator;
.source "MergeBaseGenerator.java"


# static fields
.field private static final IN_PENDING:I = 0x2

.field private static final MERGE_BASE:I = 0x8

.field private static final PARSED:I = 0x1

.field private static final POPPED:I = 0x10


# instance fields
.field private branchMask:I

.field private final pending:Lorg/eclipse/jgit/revwalk/DateRevQueue;

.field private recarryMask:I

.field private recarryTest:I

.field private final walker:Lorg/eclipse/jgit/revwalk/RevWalk;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/revwalk/RevWalk;)V
    .locals 1
    .parameter "w"

    .prologue
    .line 88
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/Generator;-><init>()V

    .line 89
    iput-object p1, p0, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    .line 90
    new-instance v0, Lorg/eclipse/jgit/revwalk/DateRevQueue;

    invoke-direct {v0}, Lorg/eclipse/jgit/revwalk/DateRevQueue;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->pending:Lorg/eclipse/jgit/revwalk/DateRevQueue;

    .line 91
    return-void
.end method

.method private add(Lorg/eclipse/jgit/revwalk/RevCommit;)V
    .locals 6
    .parameter "c"

    .prologue
    .line 116
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->allocFlag()I

    move-result v0

    .line 117
    .local v0, flag:I
    iget v1, p0, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->branchMask:I

    or-int/2addr v1, v0

    iput v1, p0, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->branchMask:I

    .line 118
    iget v1, p1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    iget v2, p0, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->branchMask:I

    and-int/2addr v1, v2

    if-eqz v1, :cond_0

    .line 123
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->staleRevFlagsOn:Ljava/lang/String;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevCommit;->name()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 125
    :cond_0
    iget v1, p1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    or-int/2addr v1, v0

    iput v1, p1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    .line 126
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->pending:Lorg/eclipse/jgit/revwalk/DateRevQueue;

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/revwalk/DateRevQueue;->add(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 127
    return-void
.end method

.method private carryOntoHistory(Lorg/eclipse/jgit/revwalk/RevCommit;I)V
    .locals 5
    .parameter "c"
    .parameter "carry"

    .prologue
    .line 185
    :cond_0
    iget-object v3, p1, Lorg/eclipse/jgit/revwalk/RevCommit;->parents:[Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 186
    .local v3, pList:[Lorg/eclipse/jgit/revwalk/RevCommit;
    if-nez v3, :cond_2

    .line 202
    :cond_1
    :goto_0
    return-void

    .line 188
    :cond_2
    array-length v1, v3

    .line 189
    .local v1, n:I
    if-eqz v1, :cond_1

    .line 192
    const/4 v0, 0x1

    .local v0, i:I
    :goto_1
    if-ge v0, v1, :cond_4

    .line 193
    aget-object v2, v3, v0

    .line 194
    .local v2, p:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-direct {p0, v2, p2}, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->carryOntoOne(Lorg/eclipse/jgit/revwalk/RevCommit;I)Z

    move-result v4

    if-nez v4, :cond_3

    .line 195
    invoke-direct {p0, v2, p2}, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->carryOntoHistory(Lorg/eclipse/jgit/revwalk/RevCommit;I)V

    .line 192
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 198
    .end local v2           #p:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_4
    const/4 v4, 0x0

    aget-object p1, v3, v4

    .line 199
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->carryOntoOne(Lorg/eclipse/jgit/revwalk/RevCommit;I)Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_0
.end method

.method private carryOntoOne(Lorg/eclipse/jgit/revwalk/RevCommit;I)Z
    .locals 4
    .parameter "p"
    .parameter "carry"

    .prologue
    const/4 v1, 0x1

    .line 205
    iget v2, p1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/2addr v2, p2

    if-ne v2, p2, :cond_0

    move v0, v1

    .line 206
    .local v0, haveAll:Z
    :goto_0
    iget v2, p1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    or-int/2addr v2, p2

    iput v2, p1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    .line 208
    iget v2, p1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    iget v3, p0, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->recarryMask:I

    and-int/2addr v2, v3

    iget v3, p0, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->recarryTest:I

    if-ne v2, v3, :cond_1

    .line 214
    iget v2, p1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/lit8 v2, v2, -0x11

    iput v2, p1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    .line 215
    iget-object v2, p0, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->pending:Lorg/eclipse/jgit/revwalk/DateRevQueue;

    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/revwalk/DateRevQueue;->add(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 216
    iget v2, p0, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->branchMask:I

    or-int/lit8 v2, v2, 0x8

    invoke-direct {p0, p1, v2}, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->carryOntoHistory(Lorg/eclipse/jgit/revwalk/RevCommit;I)V

    .line 224
    :goto_1
    return v1

    .line 205
    .end local v0           #haveAll:Z
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .restart local v0       #haveAll:Z
    :cond_1
    move v1, v0

    .line 224
    goto :goto_1
.end method


# virtual methods
.method init(Lorg/eclipse/jgit/revwalk/AbstractRevQueue;)V
    .locals 4
    .parameter "p"

    .prologue
    .line 96
    :goto_0
    :try_start_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/AbstractRevQueue;->next()Lorg/eclipse/jgit/revwalk/RevCommit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 97
    .local v0, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-nez v0, :cond_0

    .line 105
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget v2, p0, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->branchMask:I

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->freeFlag(I)V

    .line 110
    iget v1, p0, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->branchMask:I

    or-int/lit8 v1, v1, 0x10

    iput v1, p0, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->recarryTest:I

    .line 111
    iget v1, p0, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->branchMask:I

    or-int/lit8 v1, v1, 0x10

    or-int/lit8 v1, v1, 0x8

    iput v1, p0, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->recarryMask:I

    .line 113
    return-void

    .line 99
    :cond_0
    :try_start_1
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->add(Lorg/eclipse/jgit/revwalk/RevCommit;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 105
    .end local v0           #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget v3, p0, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->branchMask:I

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/revwalk/RevWalk;->freeFlag(I)V

    .line 110
    iget v2, p0, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->branchMask:I

    or-int/lit8 v2, v2, 0x10

    iput v2, p0, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->recarryTest:I

    .line 111
    iget v2, p0, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->branchMask:I

    or-int/lit8 v2, v2, 0x10

    or-int/lit8 v2, v2, 0x8

    iput v2, p0, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->recarryMask:I

    .line 105
    throw v1
.end method

.method next()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 138
    :cond_0
    iget-object v8, p0, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->pending:Lorg/eclipse/jgit/revwalk/DateRevQueue;

    invoke-virtual {v8}, Lorg/eclipse/jgit/revwalk/DateRevQueue;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v1

    .line 139
    .local v1, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-nez v1, :cond_1

    .line 140
    iget-object v8, p0, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v8, v8, Lorg/eclipse/jgit/revwalk/RevWalk;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v8}, Lorg/eclipse/jgit/lib/ObjectReader;->walkAdviceEnd()V

    move-object v1, v7

    .line 178
    .end local v1           #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    :goto_0
    return-object v1

    .line 144
    .restart local v1       #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_1
    iget-object v0, v1, Lorg/eclipse/jgit/revwalk/RevCommit;->parents:[Lorg/eclipse/jgit/revwalk/RevCommit;

    .local v0, arr$:[Lorg/eclipse/jgit/revwalk/RevCommit;
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_1
    if-ge v3, v4, :cond_4

    aget-object v6, v0, v3

    .line 145
    .local v6, p:Lorg/eclipse/jgit/revwalk/RevCommit;
    iget v8, v6, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/lit8 v8, v8, 0x2

    if-eqz v8, :cond_2

    .line 144
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 147
    :cond_2
    iget v8, v6, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/lit8 v8, v8, 0x1

    if-nez v8, :cond_3

    .line 148
    iget-object v8, p0, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v6, v8}, Lorg/eclipse/jgit/revwalk/RevCommit;->parseHeaders(Lorg/eclipse/jgit/revwalk/RevWalk;)V

    .line 149
    :cond_3
    iget v8, v6, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    or-int/lit8 v8, v8, 0x2

    iput v8, v6, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    .line 150
    iget-object v8, p0, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->pending:Lorg/eclipse/jgit/revwalk/DateRevQueue;

    invoke-virtual {v8, v6}, Lorg/eclipse/jgit/revwalk/DateRevQueue;->add(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    goto :goto_2

    .line 153
    .end local v6           #p:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_4
    iget v8, v1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    iget v9, p0, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->branchMask:I

    and-int v2, v8, v9

    .line 154
    .local v2, carry:I
    iget v8, p0, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->branchMask:I

    if-ne v2, v8, :cond_6

    const/4 v5, 0x1

    .line 155
    .local v5, mb:Z
    :goto_3
    if-eqz v5, :cond_5

    .line 160
    or-int/lit8 v2, v2, 0x8

    .line 162
    :cond_5
    invoke-direct {p0, v1, v2}, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->carryOntoHistory(Lorg/eclipse/jgit/revwalk/RevCommit;I)V

    .line 164
    iget v8, v1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/lit8 v8, v8, 0x8

    if-eqz v8, :cond_7

    .line 170
    iget-object v8, p0, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->pending:Lorg/eclipse/jgit/revwalk/DateRevQueue;

    const/16 v9, 0x8

    invoke-virtual {v8, v9}, Lorg/eclipse/jgit/revwalk/DateRevQueue;->everbodyHasFlag(I)Z

    move-result v8

    if-eqz v8, :cond_0

    move-object v1, v7

    .line 171
    goto :goto_0

    .line 154
    .end local v5           #mb:Z
    :cond_6
    const/4 v5, 0x0

    goto :goto_3

    .line 174
    .restart local v5       #mb:Z
    :cond_7
    iget v8, v1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    or-int/lit8 v8, v8, 0x10

    iput v8, v1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    .line 176
    if-eqz v5, :cond_0

    .line 177
    iget v7, v1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    or-int/lit8 v7, v7, 0x8

    iput v7, v1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    goto :goto_0
.end method

.method outputType()I
    .locals 1

    .prologue
    .line 131
    const/4 v0, 0x0

    return v0
.end method
