.class public Lorg/eclipse/jgit/merge/MergeFormatter;
.super Ljava/lang/Object;
.source "MergeFormatter.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public formatMerge(Ljava/io/OutputStream;Lorg/eclipse/jgit/merge/MergeResult;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "out"
    .parameter "res"
    .parameter "baseName"
    .parameter "oursName"
    .parameter "theirsName"
    .parameter "charsetName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 148
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 149
    .local v0, names:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 150
    invoke-interface {v0, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 151
    invoke-interface {v0, p5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 152
    invoke-virtual {p0, p1, p2, v0, p6}, Lorg/eclipse/jgit/merge/MergeFormatter;->formatMerge(Ljava/io/OutputStream;Lorg/eclipse/jgit/merge/MergeResult;Ljava/util/List;Ljava/lang/String;)V

    .line 153
    return-void
.end method

.method public formatMerge(Ljava/io/OutputStream;Lorg/eclipse/jgit/merge/MergeResult;Ljava/util/List;Ljava/lang/String;)V
    .locals 8
    .parameter "out"
    .parameter
    .parameter
    .parameter "charsetName"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/OutputStream;",
            "Lorg/eclipse/jgit/merge/MergeResult",
            "<",
            "Lorg/eclipse/jgit/diff/RawText;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 81
    .local p2, res:Lorg/eclipse/jgit/merge/MergeResult;,"Lorg/eclipse/jgit/merge/MergeResult<Lorg/eclipse/jgit/diff/RawText;>;"
    .local p3, seqName:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    const/4 v3, 0x0

    .line 83
    .local v3, lastConflictingName:Ljava/lang/String;
    invoke-virtual {p2}, Lorg/eclipse/jgit/merge/MergeResult;->getSequences()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    const/4 v7, 0x3

    if-ne v6, v7, :cond_3

    const/4 v5, 0x1

    .line 84
    .local v5, threeWayMerge:Z
    :goto_0
    invoke-virtual {p2}, Lorg/eclipse/jgit/merge/MergeResult;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/merge/MergeChunk;

    .line 85
    .local v0, chunk:Lorg/eclipse/jgit/merge/MergeChunk;
    invoke-virtual {p2}, Lorg/eclipse/jgit/merge/MergeResult;->getSequences()Ljava/util/List;

    move-result-object v6

    invoke-virtual {v0}, Lorg/eclipse/jgit/merge/MergeChunk;->getSequenceIndex()I

    move-result v7

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/diff/RawText;

    .line 86
    .local v4, seq:Lorg/eclipse/jgit/diff/RawText;
    if-eqz v3, :cond_1

    invoke-virtual {v0}, Lorg/eclipse/jgit/merge/MergeChunk;->getConflictState()Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    move-result-object v6

    sget-object v7, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->NEXT_CONFLICTING_RANGE:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    if-eq v6, v7, :cond_1

    .line 89
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, ">>>>>>> "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, p4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v6

    invoke-virtual {p1, v6}, Ljava/io/OutputStream;->write([B)V

    .line 90
    const/4 v3, 0x0

    .line 92
    :cond_1
    invoke-virtual {v0}, Lorg/eclipse/jgit/merge/MergeChunk;->getConflictState()Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    move-result-object v6

    sget-object v7, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->FIRST_CONFLICTING_RANGE:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    if-ne v6, v7, :cond_4

    .line 94
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "<<<<<<< "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v0}, Lorg/eclipse/jgit/merge/MergeChunk;->getSequenceIndex()I

    move-result v6

    invoke-interface {p3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, p4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v6

    invoke-virtual {p1, v6}, Ljava/io/OutputStream;->write([B)V

    .line 96
    invoke-virtual {v0}, Lorg/eclipse/jgit/merge/MergeChunk;->getSequenceIndex()I

    move-result v6

    invoke-interface {p3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    .end local v3           #lastConflictingName:Ljava/lang/String;
    check-cast v3, Ljava/lang/String;

    .line 112
    .restart local v3       #lastConflictingName:Ljava/lang/String;
    :cond_2
    :goto_1
    invoke-virtual {v0}, Lorg/eclipse/jgit/merge/MergeChunk;->getBegin()I

    move-result v1

    .local v1, i:I
    :goto_2
    invoke-virtual {v0}, Lorg/eclipse/jgit/merge/MergeChunk;->getEnd()I

    move-result v6

    if-ge v1, v6, :cond_0

    .line 113
    invoke-virtual {v4, p1, v1}, Lorg/eclipse/jgit/diff/RawText;->writeLine(Ljava/io/OutputStream;I)V

    .line 114
    const/16 v6, 0xa

    invoke-virtual {p1, v6}, Ljava/io/OutputStream;->write(I)V

    .line 112
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 83
    .end local v0           #chunk:Lorg/eclipse/jgit/merge/MergeChunk;
    .end local v1           #i:I
    .end local v2           #i$:Ljava/util/Iterator;
    .end local v4           #seq:Lorg/eclipse/jgit/diff/RawText;
    .end local v5           #threeWayMerge:Z
    :cond_3
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 97
    .restart local v0       #chunk:Lorg/eclipse/jgit/merge/MergeChunk;
    .restart local v2       #i$:Ljava/util/Iterator;
    .restart local v4       #seq:Lorg/eclipse/jgit/diff/RawText;
    .restart local v5       #threeWayMerge:Z
    :cond_4
    invoke-virtual {v0}, Lorg/eclipse/jgit/merge/MergeChunk;->getConflictState()Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    move-result-object v6

    sget-object v7, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->NEXT_CONFLICTING_RANGE:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    if-ne v6, v7, :cond_2

    .line 107
    invoke-virtual {v0}, Lorg/eclipse/jgit/merge/MergeChunk;->getSequenceIndex()I

    move-result v6

    invoke-interface {p3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    .end local v3           #lastConflictingName:Ljava/lang/String;
    check-cast v3, Ljava/lang/String;

    .line 108
    .restart local v3       #lastConflictingName:Ljava/lang/String;
    if-eqz v5, :cond_5

    const-string v6, "=======\n"

    :goto_3
    invoke-virtual {v6, p4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v6

    invoke-virtual {p1, v6}, Ljava/io/OutputStream;->write([B)V

    goto :goto_1

    :cond_5
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "======= "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_3

    .line 119
    .end local v0           #chunk:Lorg/eclipse/jgit/merge/MergeChunk;
    .end local v4           #seq:Lorg/eclipse/jgit/diff/RawText;
    :cond_6
    if-eqz v3, :cond_7

    .line 120
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, ">>>>>>> "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, p4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v6

    invoke-virtual {p1, v6}, Ljava/io/OutputStream;->write([B)V

    .line 122
    :cond_7
    return-void
.end method
