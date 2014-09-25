.class public Lorg/eclipse/jgit/merge/MergeChunk;
.super Ljava/lang/Object;
.source "MergeChunk.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;
    }
.end annotation


# instance fields
.field private final begin:I

.field private final conflictState:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

.field private final end:I

.field private final sequenceIndex:I


# direct methods
.method protected constructor <init>(IIILorg/eclipse/jgit/merge/MergeChunk$ConflictState;)V
    .locals 0
    .parameter "sequenceIndex"
    .parameter "begin"
    .parameter "end"
    .parameter "conflictState"

    .prologue
    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 104
    iput p1, p0, Lorg/eclipse/jgit/merge/MergeChunk;->sequenceIndex:I

    .line 105
    iput p2, p0, Lorg/eclipse/jgit/merge/MergeChunk;->begin:I

    .line 106
    iput p3, p0, Lorg/eclipse/jgit/merge/MergeChunk;->end:I

    .line 107
    iput-object p4, p0, Lorg/eclipse/jgit/merge/MergeChunk;->conflictState:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    .line 108
    return-void
.end method


# virtual methods
.method public getBegin()I
    .locals 1

    .prologue
    .line 123
    iget v0, p0, Lorg/eclipse/jgit/merge/MergeChunk;->begin:I

    return v0
.end method

.method public getConflictState()Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;
    .locals 1

    .prologue
    .line 140
    iget-object v0, p0, Lorg/eclipse/jgit/merge/MergeChunk;->conflictState:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    return-object v0
.end method

.method public getEnd()I
    .locals 1

    .prologue
    .line 133
    iget v0, p0, Lorg/eclipse/jgit/merge/MergeChunk;->end:I

    return v0
.end method

.method public getSequenceIndex()I
    .locals 1

    .prologue
    .line 115
    iget v0, p0, Lorg/eclipse/jgit/merge/MergeChunk;->sequenceIndex:I

    return v0
.end method
