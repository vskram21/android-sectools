.class public Lorg/eclipse/jgit/merge/MergeResult;
.super Ljava/lang/Object;
.source "MergeResult.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S:",
        "Lorg/eclipse/jgit/diff/Sequence;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<",
        "Lorg/eclipse/jgit/merge/MergeChunk;",
        ">;"
    }
.end annotation


# static fields
.field private static final states:[Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;


# instance fields
.field private final chunks:Lorg/eclipse/jgit/util/IntList;

.field private containsConflicts:Z

.field private final sequences:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TS;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 130
    invoke-static {}, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->values()[Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/merge/MergeResult;->states:[Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TS;>;)V"
        }
    .end annotation

    .prologue
    .line 85
    .local p0, this:Lorg/eclipse/jgit/merge/MergeResult;,"Lorg/eclipse/jgit/merge/MergeResult<TS;>;"
    .local p1, sequences:Ljava/util/List;,"Ljava/util/List<TS;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    new-instance v0, Lorg/eclipse/jgit/util/IntList;

    invoke-direct {v0}, Lorg/eclipse/jgit/util/IntList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/merge/MergeResult;->chunks:Lorg/eclipse/jgit/util/IntList;

    .line 75
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/eclipse/jgit/merge/MergeResult;->containsConflicts:Z

    .line 86
    iput-object p1, p0, Lorg/eclipse/jgit/merge/MergeResult;->sequences:Ljava/util/List;

    .line 87
    return-void
.end method

.method static synthetic access$000(Lorg/eclipse/jgit/merge/MergeResult;)Lorg/eclipse/jgit/util/IntList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 70
    iget-object v0, p0, Lorg/eclipse/jgit/merge/MergeResult;->chunks:Lorg/eclipse/jgit/util/IntList;

    return-object v0
.end method

.method static synthetic access$100()[Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;
    .locals 1

    .prologue
    .line 70
    sget-object v0, Lorg/eclipse/jgit/merge/MergeResult;->states:[Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    return-object v0
.end method


# virtual methods
.method public add(IIILorg/eclipse/jgit/merge/MergeChunk$ConflictState;)V
    .locals 2
    .parameter "srcIdx"
    .parameter "begin"
    .parameter "end"
    .parameter "conflictState"

    .prologue
    .line 111
    .local p0, this:Lorg/eclipse/jgit/merge/MergeResult;,"Lorg/eclipse/jgit/merge/MergeResult<TS;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/merge/MergeResult;->chunks:Lorg/eclipse/jgit/util/IntList;

    invoke-virtual {p4}, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->ordinal()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/util/IntList;->add(I)V

    .line 112
    iget-object v0, p0, Lorg/eclipse/jgit/merge/MergeResult;->chunks:Lorg/eclipse/jgit/util/IntList;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/util/IntList;->add(I)V

    .line 113
    iget-object v0, p0, Lorg/eclipse/jgit/merge/MergeResult;->chunks:Lorg/eclipse/jgit/util/IntList;

    invoke-virtual {v0, p2}, Lorg/eclipse/jgit/util/IntList;->add(I)V

    .line 114
    iget-object v0, p0, Lorg/eclipse/jgit/merge/MergeResult;->chunks:Lorg/eclipse/jgit/util/IntList;

    invoke-virtual {v0, p3}, Lorg/eclipse/jgit/util/IntList;->add(I)V

    .line 115
    sget-object v0, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->NO_CONFLICT:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    if-eq p4, v0, :cond_0

    .line 116
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/merge/MergeResult;->containsConflicts:Z

    .line 117
    :cond_0
    return-void
.end method

.method public containsConflicts()Z
    .locals 1

    .prologue
    .line 162
    .local p0, this:Lorg/eclipse/jgit/merge/MergeResult;,"Lorg/eclipse/jgit/merge/MergeResult<TS;>;"
    iget-boolean v0, p0, Lorg/eclipse/jgit/merge/MergeResult;->containsConflicts:Z

    return v0
.end method

.method public getSequences()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<TS;>;"
        }
    .end annotation

    .prologue
    .line 127
    .local p0, this:Lorg/eclipse/jgit/merge/MergeResult;,"Lorg/eclipse/jgit/merge/MergeResult<TS;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/merge/MergeResult;->sequences:Ljava/util/List;

    return-object v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/eclipse/jgit/merge/MergeChunk;",
            ">;"
        }
    .end annotation

    .prologue
    .line 137
    .local p0, this:Lorg/eclipse/jgit/merge/MergeResult;,"Lorg/eclipse/jgit/merge/MergeResult<TS;>;"
    new-instance v0, Lorg/eclipse/jgit/merge/MergeResult$1;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/merge/MergeResult$1;-><init>(Lorg/eclipse/jgit/merge/MergeResult;)V

    return-object v0
.end method
