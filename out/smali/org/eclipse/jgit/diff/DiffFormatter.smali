.class public Lorg/eclipse/jgit/diff/DiffFormatter;
.super Ljava/lang/Object;
.source "DiffFormatter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/diff/DiffFormatter$1;,
        Lorg/eclipse/jgit/diff/DiffFormatter$FormatResult;
    }
.end annotation


# static fields
.field private static final BINARY:[B = null

.field private static final DEFAULT_BINARY_FILE_THRESHOLD:I = 0x3200000

.field private static final EMPTY:[B

.field private static final noNewLine:[B


# instance fields
.field private abbreviationLength:I

.field private binaryFileThreshold:I

.field private comparator:Lorg/eclipse/jgit/diff/RawTextComparator;

.field private context:I

.field private db:Lorg/eclipse/jgit/lib/Repository;

.field private diffAlgorithm:Lorg/eclipse/jgit/diff/DiffAlgorithm;

.field private diffCfg:Lorg/eclipse/jgit/diff/DiffConfig;

.field private newPrefix:Ljava/lang/String;

.field private oldPrefix:Ljava/lang/String;

.field private final out:Ljava/io/OutputStream;

.field private pathFilter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

.field private progressMonitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

.field private reader:Lorg/eclipse/jgit/lib/ObjectReader;

.field private renameDetector:Lorg/eclipse/jgit/diff/RenameDetector;

.field private source:Lorg/eclipse/jgit/diff/ContentSource$Pair;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 108
    const-string v0, "\\ No newline at end of file\n"

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/diff/DiffFormatter;->noNewLine:[B

    .line 111
    new-array v0, v1, [B

    sput-object v0, Lorg/eclipse/jgit/diff/DiffFormatter;->EMPTY:[B

    .line 114
    new-array v0, v1, [B

    sput-object v0, Lorg/eclipse/jgit/diff/DiffFormatter;->BINARY:[B

    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 1
    .parameter "out"

    .prologue
    .line 154
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 124
    const/4 v0, 0x3

    iput v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->context:I

    .line 126
    const/4 v0, 0x7

    iput v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->abbreviationLength:I

    .line 130
    sget-object v0, Lorg/eclipse/jgit/diff/RawTextComparator;->DEFAULT:Lorg/eclipse/jgit/diff/RawTextComparator;

    iput-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->comparator:Lorg/eclipse/jgit/diff/RawTextComparator;

    .line 132
    const/high16 v0, 0x320

    iput v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->binaryFileThreshold:I

    .line 134
    const-string v0, "a/"

    iput-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->oldPrefix:Ljava/lang/String;

    .line 136
    const-string v0, "b/"

    iput-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->newPrefix:Ljava/lang/String;

    .line 138
    sget-object v0, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->ALL:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    iput-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->pathFilter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    .line 155
    iput-object p1, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->out:Ljava/io/OutputStream;

    .line 156
    return-void
.end method

.method private assertHaveRepository()V
    .locals 2

    .prologue
    .line 962
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->db:Lorg/eclipse/jgit/lib/Repository;

    if-nez v0, :cond_0

    .line 963
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->repositoryIsRequired:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 964
    :cond_0
    return-void
.end method

.method private combineA(Ljava/util/List;I)Z
    .locals 2
    .parameter
    .parameter "i"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/Edit;",
            ">;I)Z"
        }
    .end annotation

    .prologue
    .line 1166
    .local p1, e:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/Edit;>;"
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/diff/Edit;

    invoke-virtual {v0}, Lorg/eclipse/jgit/diff/Edit;->getBeginA()I

    move-result v1

    add-int/lit8 v0, p2, -0x1

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/diff/Edit;

    invoke-virtual {v0}, Lorg/eclipse/jgit/diff/Edit;->getEndA()I

    move-result v0

    sub-int v0, v1, v0

    iget v1, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->context:I

    mul-int/lit8 v1, v1, 0x2

    if-gt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private combineB(Ljava/util/List;I)Z
    .locals 2
    .parameter
    .parameter "i"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/Edit;",
            ">;I)Z"
        }
    .end annotation

    .prologue
    .line 1170
    .local p1, e:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/Edit;>;"
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/diff/Edit;

    invoke-virtual {v0}, Lorg/eclipse/jgit/diff/Edit;->getBeginB()I

    move-result v1

    add-int/lit8 v0, p2, -0x1

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/diff/Edit;

    invoke-virtual {v0}, Lorg/eclipse/jgit/diff/Edit;->getEndB()I

    move-result v0

    sub-int v0, v1, v0

    iget v1, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->context:I

    mul-int/lit8 v1, v1, 0x2

    if-gt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private createFormatResult(Lorg/eclipse/jgit/diff/DiffEntry;)Lorg/eclipse/jgit/diff/DiffFormatter$FormatResult;
    .locals 8
    .parameter "ent"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Lorg/eclipse/jgit/errors/MissingObjectException;
        }
    .end annotation

    .prologue
    .line 902
    new-instance v4, Lorg/eclipse/jgit/diff/DiffFormatter$FormatResult;

    const/4 v6, 0x0

    invoke-direct {v4, v6}, Lorg/eclipse/jgit/diff/DiffFormatter$FormatResult;-><init>(Lorg/eclipse/jgit/diff/DiffFormatter$1;)V

    .line 903
    .local v4, res:Lorg/eclipse/jgit/diff/DiffFormatter$FormatResult;
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 907
    .local v2, buf:Ljava/io/ByteArrayOutputStream;
    invoke-direct {p0, v2, p1}, Lorg/eclipse/jgit/diff/DiffFormatter;->formatHeader(Ljava/io/ByteArrayOutputStream;Lorg/eclipse/jgit/diff/DiffEntry;)V

    .line 909
    invoke-virtual {p1}, Lorg/eclipse/jgit/diff/DiffEntry;->getOldMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v6

    sget-object v7, Lorg/eclipse/jgit/lib/FileMode;->GITLINK:Lorg/eclipse/jgit/lib/FileMode;

    if-eq v6, v7, :cond_0

    invoke-virtual {p1}, Lorg/eclipse/jgit/diff/DiffEntry;->getNewMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v6

    sget-object v7, Lorg/eclipse/jgit/lib/FileMode;->GITLINK:Lorg/eclipse/jgit/lib/FileMode;

    if-ne v6, v7, :cond_2

    .line 910
    :cond_0
    invoke-direct {p0, v2, p1}, Lorg/eclipse/jgit/diff/DiffFormatter;->formatOldNewPaths(Ljava/io/ByteArrayOutputStream;Lorg/eclipse/jgit/diff/DiffEntry;)V

    .line 911
    invoke-static {v2, p1}, Lorg/eclipse/jgit/diff/DiffFormatter;->writeGitLinkDiffText(Ljava/io/OutputStream;Lorg/eclipse/jgit/diff/DiffEntry;)V

    .line 912
    new-instance v3, Lorg/eclipse/jgit/diff/EditList;

    invoke-direct {v3}, Lorg/eclipse/jgit/diff/EditList;-><init>()V

    .line 913
    .local v3, editList:Lorg/eclipse/jgit/diff/EditList;
    sget-object v5, Lorg/eclipse/jgit/patch/FileHeader$PatchType;->UNIFIED:Lorg/eclipse/jgit/patch/FileHeader$PatchType;

    .line 953
    .local v5, type:Lorg/eclipse/jgit/patch/FileHeader$PatchType;
    :cond_1
    :goto_0
    new-instance v6, Lorg/eclipse/jgit/patch/FileHeader;

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v7

    invoke-direct {v6, v7, v3, v5}, Lorg/eclipse/jgit/patch/FileHeader;-><init>([BLorg/eclipse/jgit/diff/EditList;Lorg/eclipse/jgit/patch/FileHeader$PatchType;)V

    iput-object v6, v4, Lorg/eclipse/jgit/diff/DiffFormatter$FormatResult;->header:Lorg/eclipse/jgit/patch/FileHeader;

    .line 954
    return-object v4

    .line 915
    .end local v3           #editList:Lorg/eclipse/jgit/diff/EditList;
    .end local v5           #type:Lorg/eclipse/jgit/patch/FileHeader$PatchType;
    :cond_2
    invoke-virtual {p1}, Lorg/eclipse/jgit/diff/DiffEntry;->getOldId()Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v6

    if-eqz v6, :cond_3

    invoke-virtual {p1}, Lorg/eclipse/jgit/diff/DiffEntry;->getNewId()Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v6

    if-nez v6, :cond_4

    .line 917
    :cond_3
    new-instance v3, Lorg/eclipse/jgit/diff/EditList;

    invoke-direct {v3}, Lorg/eclipse/jgit/diff/EditList;-><init>()V

    .line 918
    .restart local v3       #editList:Lorg/eclipse/jgit/diff/EditList;
    sget-object v5, Lorg/eclipse/jgit/patch/FileHeader$PatchType;->UNIFIED:Lorg/eclipse/jgit/patch/FileHeader$PatchType;

    .restart local v5       #type:Lorg/eclipse/jgit/patch/FileHeader$PatchType;
    goto :goto_0

    .line 921
    .end local v3           #editList:Lorg/eclipse/jgit/diff/EditList;
    .end local v5           #type:Lorg/eclipse/jgit/patch/FileHeader$PatchType;
    :cond_4
    invoke-direct {p0}, Lorg/eclipse/jgit/diff/DiffFormatter;->assertHaveRepository()V

    .line 923
    sget-object v6, Lorg/eclipse/jgit/diff/DiffEntry$Side;->OLD:Lorg/eclipse/jgit/diff/DiffEntry$Side;

    invoke-direct {p0, v6, p1}, Lorg/eclipse/jgit/diff/DiffFormatter;->open(Lorg/eclipse/jgit/diff/DiffEntry$Side;Lorg/eclipse/jgit/diff/DiffEntry;)[B

    move-result-object v0

    .line 924
    .local v0, aRaw:[B
    sget-object v6, Lorg/eclipse/jgit/diff/DiffEntry$Side;->NEW:Lorg/eclipse/jgit/diff/DiffEntry$Side;

    invoke-direct {p0, v6, p1}, Lorg/eclipse/jgit/diff/DiffFormatter;->open(Lorg/eclipse/jgit/diff/DiffEntry$Side;Lorg/eclipse/jgit/diff/DiffEntry;)[B

    move-result-object v1

    .line 926
    .local v1, bRaw:[B
    sget-object v6, Lorg/eclipse/jgit/diff/DiffFormatter;->BINARY:[B

    if-eq v0, v6, :cond_5

    sget-object v6, Lorg/eclipse/jgit/diff/DiffFormatter;->BINARY:[B

    if-eq v1, v6, :cond_5

    invoke-static {v0}, Lorg/eclipse/jgit/diff/RawText;->isBinary([B)Z

    move-result v6

    if-nez v6, :cond_5

    invoke-static {v1}, Lorg/eclipse/jgit/diff/RawText;->isBinary([B)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 928
    :cond_5
    invoke-direct {p0, v2, p1}, Lorg/eclipse/jgit/diff/DiffFormatter;->formatOldNewPaths(Ljava/io/ByteArrayOutputStream;Lorg/eclipse/jgit/diff/DiffEntry;)V

    .line 929
    const-string v6, "Binary files differ\n"

    invoke-static {v6}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 930
    new-instance v3, Lorg/eclipse/jgit/diff/EditList;

    invoke-direct {v3}, Lorg/eclipse/jgit/diff/EditList;-><init>()V

    .line 931
    .restart local v3       #editList:Lorg/eclipse/jgit/diff/EditList;
    sget-object v5, Lorg/eclipse/jgit/patch/FileHeader$PatchType;->BINARY:Lorg/eclipse/jgit/patch/FileHeader$PatchType;

    .restart local v5       #type:Lorg/eclipse/jgit/patch/FileHeader$PatchType;
    goto :goto_0

    .line 934
    .end local v3           #editList:Lorg/eclipse/jgit/diff/EditList;
    .end local v5           #type:Lorg/eclipse/jgit/patch/FileHeader$PatchType;
    :cond_6
    new-instance v6, Lorg/eclipse/jgit/diff/RawText;

    invoke-direct {v6, v0}, Lorg/eclipse/jgit/diff/RawText;-><init>([B)V

    iput-object v6, v4, Lorg/eclipse/jgit/diff/DiffFormatter$FormatResult;->a:Lorg/eclipse/jgit/diff/RawText;

    .line 935
    new-instance v6, Lorg/eclipse/jgit/diff/RawText;

    invoke-direct {v6, v1}, Lorg/eclipse/jgit/diff/RawText;-><init>([B)V

    iput-object v6, v4, Lorg/eclipse/jgit/diff/DiffFormatter$FormatResult;->b:Lorg/eclipse/jgit/diff/RawText;

    .line 936
    iget-object v6, v4, Lorg/eclipse/jgit/diff/DiffFormatter$FormatResult;->a:Lorg/eclipse/jgit/diff/RawText;

    iget-object v7, v4, Lorg/eclipse/jgit/diff/DiffFormatter$FormatResult;->b:Lorg/eclipse/jgit/diff/RawText;

    invoke-direct {p0, v6, v7}, Lorg/eclipse/jgit/diff/DiffFormatter;->diff(Lorg/eclipse/jgit/diff/RawText;Lorg/eclipse/jgit/diff/RawText;)Lorg/eclipse/jgit/diff/EditList;

    move-result-object v3

    .line 937
    .restart local v3       #editList:Lorg/eclipse/jgit/diff/EditList;
    sget-object v5, Lorg/eclipse/jgit/patch/FileHeader$PatchType;->UNIFIED:Lorg/eclipse/jgit/patch/FileHeader$PatchType;

    .line 939
    .restart local v5       #type:Lorg/eclipse/jgit/patch/FileHeader$PatchType;
    sget-object v6, Lorg/eclipse/jgit/diff/DiffFormatter$1;->$SwitchMap$org$eclipse$jgit$diff$DiffEntry$ChangeType:[I

    invoke-virtual {p1}, Lorg/eclipse/jgit/diff/DiffEntry;->getChangeType()Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    move-result-object v7

    invoke-virtual {v7}, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_0

    .line 947
    invoke-direct {p0, v2, p1}, Lorg/eclipse/jgit/diff/DiffFormatter;->formatOldNewPaths(Ljava/io/ByteArrayOutputStream;Lorg/eclipse/jgit/diff/DiffEntry;)V

    goto/16 :goto_0

    .line 942
    :pswitch_0
    invoke-virtual {v3}, Lorg/eclipse/jgit/diff/EditList;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_1

    .line 943
    invoke-direct {p0, v2, p1}, Lorg/eclipse/jgit/diff/DiffFormatter;->formatOldNewPaths(Ljava/io/ByteArrayOutputStream;Lorg/eclipse/jgit/diff/DiffEntry;)V

    goto/16 :goto_0

    .line 939
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private detectRenames(Ljava/util/List;)Ljava/util/List;
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 522
    .local p1, files:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->renameDetector:Lorg/eclipse/jgit/diff/RenameDetector;

    invoke-virtual {v0}, Lorg/eclipse/jgit/diff/RenameDetector;->reset()V

    .line 523
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->renameDetector:Lorg/eclipse/jgit/diff/RenameDetector;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/diff/RenameDetector;->addAll(Ljava/util/Collection;)V

    .line 524
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->renameDetector:Lorg/eclipse/jgit/diff/RenameDetector;

    iget-object v1, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    iget-object v2, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->progressMonitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/diff/RenameDetector;->compute(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/ProgressMonitor;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private diff(Lorg/eclipse/jgit/diff/RawText;Lorg/eclipse/jgit/diff/RawText;)Lorg/eclipse/jgit/diff/EditList;
    .locals 2
    .parameter "a"
    .parameter "b"

    .prologue
    .line 958
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->diffAlgorithm:Lorg/eclipse/jgit/diff/DiffAlgorithm;

    iget-object v1, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->comparator:Lorg/eclipse/jgit/diff/RawTextComparator;

    invoke-virtual {v0, v1, p1, p2}, Lorg/eclipse/jgit/diff/DiffAlgorithm;->diff(Lorg/eclipse/jgit/diff/SequenceComparator;Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Sequence;)Lorg/eclipse/jgit/diff/EditList;

    move-result-object v0

    return-object v0
.end method

.method private static end(Lorg/eclipse/jgit/diff/Edit;II)Z
    .locals 1
    .parameter "edit"
    .parameter "a"
    .parameter "b"

    .prologue
    .line 1174
    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/Edit;->getEndA()I

    move-result v0

    if-gt v0, p1, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/Edit;->getEndB()I

    move-result v0

    if-gt v0, p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private findCombinedEnd(Ljava/util/List;I)I
    .locals 2
    .parameter
    .parameter "i"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/Edit;",
            ">;I)I"
        }
    .end annotation

    .prologue
    .line 1158
    .local p1, edits:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/Edit;>;"
    add-int/lit8 v0, p2, 0x1

    .line 1159
    .local v0, end:I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/diff/DiffFormatter;->combineA(Ljava/util/List;I)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/diff/DiffFormatter;->combineB(Ljava/util/List;I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1161
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1162
    :cond_1
    add-int/lit8 v1, v0, -0x1

    return v1
.end method

.method private format(Lorg/eclipse/jgit/lib/AbbreviatedObjectId;)Ljava/lang/String;
    .locals 3
    .parameter "id"

    .prologue
    .line 649
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->isComplete()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->db:Lorg/eclipse/jgit/lib/Repository;

    if-eqz v0, :cond_0

    .line 651
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    iget v2, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->abbreviationLength:I

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/lib/ObjectReader;->abbreviate(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p1

    .line 656
    :cond_0
    :goto_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->name()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 652
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private formatHeader(Ljava/io/ByteArrayOutputStream;Lorg/eclipse/jgit/diff/DiffEntry;)V
    .locals 8
    .parameter "o"
    .parameter "ent"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v7, 0xa

    .line 1039
    invoke-virtual {p2}, Lorg/eclipse/jgit/diff/DiffEntry;->getChangeType()Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    move-result-object v4

    .line 1040
    .local v4, type:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;
    invoke-virtual {p2}, Lorg/eclipse/jgit/diff/DiffEntry;->getOldPath()Ljava/lang/String;

    move-result-object v3

    .line 1041
    .local v3, oldp:Ljava/lang/String;
    invoke-virtual {p2}, Lorg/eclipse/jgit/diff/DiffEntry;->getNewPath()Ljava/lang/String;

    move-result-object v1

    .line 1042
    .local v1, newp:Ljava/lang/String;
    invoke-virtual {p2}, Lorg/eclipse/jgit/diff/DiffEntry;->getOldMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v2

    .line 1043
    .local v2, oldMode:Lorg/eclipse/jgit/lib/FileMode;
    invoke-virtual {p2}, Lorg/eclipse/jgit/diff/DiffEntry;->getNewMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v0

    .line 1045
    .local v0, newMode:Lorg/eclipse/jgit/lib/FileMode;
    invoke-virtual {p0, p1, v4, v3, v1}, Lorg/eclipse/jgit/diff/DiffFormatter;->formatGitDiffFirstHeaderLine(Ljava/io/ByteArrayOutputStream;Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;Ljava/lang/String;Ljava/lang/String;)V

    .line 1047
    sget-object v5, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->MODIFY:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    if-eq v4, v5, :cond_0

    sget-object v5, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->COPY:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    if-eq v4, v5, :cond_0

    sget-object v5, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->RENAME:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    if-ne v4, v5, :cond_1

    :cond_0
    invoke-virtual {v2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 1049
    const-string v5, "old mode "

    invoke-static {v5}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 1050
    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/lib/FileMode;->copyTo(Ljava/io/OutputStream;)V

    .line 1051
    invoke-virtual {p1, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1053
    const-string v5, "new mode "

    invoke-static {v5}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 1054
    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/lib/FileMode;->copyTo(Ljava/io/OutputStream;)V

    .line 1055
    invoke-virtual {p1, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1058
    :cond_1
    sget-object v5, Lorg/eclipse/jgit/diff/DiffFormatter$1;->$SwitchMap$org$eclipse$jgit$diff$DiffEntry$ChangeType:[I

    invoke-virtual {v4}, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_0

    .line 1102
    :cond_2
    :goto_0
    invoke-virtual {p2}, Lorg/eclipse/jgit/diff/DiffEntry;->getOldId()Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v5

    if-eqz v5, :cond_3

    invoke-virtual {p2}, Lorg/eclipse/jgit/diff/DiffEntry;->getOldId()Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v5

    invoke-virtual {p2}, Lorg/eclipse/jgit/diff/DiffEntry;->getNewId()Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 1103
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/diff/DiffFormatter;->formatIndexLine(Ljava/io/OutputStream;Lorg/eclipse/jgit/diff/DiffEntry;)V

    .line 1105
    :cond_3
    return-void

    .line 1060
    :pswitch_0
    const-string v5, "new file mode "

    invoke-static {v5}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 1061
    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/lib/FileMode;->copyTo(Ljava/io/OutputStream;)V

    .line 1062
    invoke-virtual {p1, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_0

    .line 1066
    :pswitch_1
    const-string v5, "deleted file mode "

    invoke-static {v5}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 1067
    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/lib/FileMode;->copyTo(Ljava/io/OutputStream;)V

    .line 1068
    invoke-virtual {p1, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_0

    .line 1072
    :pswitch_2
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "similarity index "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p2}, Lorg/eclipse/jgit/diff/DiffEntry;->getScore()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "%"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 1073
    invoke-virtual {p1, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1075
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "rename from "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v3}, Lorg/eclipse/jgit/diff/DiffFormatter;->quotePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 1076
    invoke-virtual {p1, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1078
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "rename to "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v1}, Lorg/eclipse/jgit/diff/DiffFormatter;->quotePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 1079
    invoke-virtual {p1, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto/16 :goto_0

    .line 1083
    :pswitch_3
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "similarity index "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p2}, Lorg/eclipse/jgit/diff/DiffEntry;->getScore()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "%"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 1084
    invoke-virtual {p1, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1086
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "copy from "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v3}, Lorg/eclipse/jgit/diff/DiffFormatter;->quotePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 1087
    invoke-virtual {p1, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1089
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "copy to "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v1}, Lorg/eclipse/jgit/diff/DiffFormatter;->quotePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 1090
    invoke-virtual {p1, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto/16 :goto_0

    .line 1094
    :pswitch_4
    invoke-virtual {p2}, Lorg/eclipse/jgit/diff/DiffEntry;->getScore()I

    move-result v5

    if-lez v5, :cond_2

    .line 1095
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "dissimilarity index "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p2}, Lorg/eclipse/jgit/diff/DiffEntry;->getScore()I

    move-result v6

    rsub-int/lit8 v6, v6, 0x64

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "%"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 1097
    invoke-virtual {p1, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto/16 :goto_0

    .line 1058
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_1
        :pswitch_4
    .end packed-switch
.end method

.method private formatOldNewPaths(Ljava/io/ByteArrayOutputStream;Lorg/eclipse/jgit/diff/DiffEntry;)V
    .locals 4
    .parameter "o"
    .parameter "ent"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1130
    iget-object v2, p2, Lorg/eclipse/jgit/diff/DiffEntry;->oldId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    iget-object v3, p2, Lorg/eclipse/jgit/diff/DiffEntry;->newId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1155
    :goto_0
    return-void

    .line 1136
    :cond_0
    sget-object v2, Lorg/eclipse/jgit/diff/DiffFormatter$1;->$SwitchMap$org$eclipse$jgit$diff$DiffEntry$ChangeType:[I

    invoke-virtual {p2}, Lorg/eclipse/jgit/diff/DiffEntry;->getChangeType()Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    move-result-object v3

    invoke-virtual {v3}, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 1148
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->oldPrefix:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p2}, Lorg/eclipse/jgit/diff/DiffEntry;->getOldPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/eclipse/jgit/diff/DiffFormatter;->quotePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1149
    .local v1, oldp:Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->newPrefix:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p2}, Lorg/eclipse/jgit/diff/DiffEntry;->getNewPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/eclipse/jgit/diff/DiffFormatter;->quotePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1153
    .local v0, newp:Ljava/lang/String;
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "--- "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 1154
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "+++ "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/ByteArrayOutputStream;->write([B)V

    goto/16 :goto_0

    .line 1138
    .end local v0           #newp:Ljava/lang/String;
    .end local v1           #oldp:Ljava/lang/String;
    :pswitch_0
    const-string v1, "/dev/null"

    .line 1139
    .restart local v1       #oldp:Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->newPrefix:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p2}, Lorg/eclipse/jgit/diff/DiffEntry;->getNewPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/eclipse/jgit/diff/DiffFormatter;->quotePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1140
    .restart local v0       #newp:Ljava/lang/String;
    goto :goto_1

    .line 1143
    .end local v0           #newp:Ljava/lang/String;
    .end local v1           #oldp:Ljava/lang/String;
    :pswitch_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->oldPrefix:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p2}, Lorg/eclipse/jgit/diff/DiffEntry;->getOldPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/eclipse/jgit/diff/DiffFormatter;->quotePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1144
    .restart local v1       #oldp:Ljava/lang/String;
    const-string v0, "/dev/null"

    .line 1145
    .restart local v0       #newp:Ljava/lang/String;
    goto :goto_1

    .line 1136
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private static getDiffTreeFilterFor(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    .locals 4
    .parameter "a"
    .parameter "b"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 500
    instance-of v1, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    if-eqz v1, :cond_1

    instance-of v1, p1, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    if-eqz v1, :cond_1

    .line 501
    new-instance v0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;

    invoke-direct {v0, v2, v3}, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;-><init>(II)V

    .line 511
    :cond_0
    :goto_0
    return-object v0

    .line 503
    :cond_1
    instance-of v1, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    if-eqz v1, :cond_2

    instance-of v1, p1, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    if-eqz v1, :cond_2

    .line 504
    new-instance v0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;

    invoke-direct {v0, v3, v2}, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;-><init>(II)V

    goto :goto_0

    .line 506
    :cond_2
    sget-object v0, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->ANY_DIFF:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    .line 507
    .local v0, filter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    instance-of v1, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    if-eqz v1, :cond_3

    .line 508
    new-instance v1, Lorg/eclipse/jgit/treewalk/filter/NotIgnoredFilter;

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/treewalk/filter/NotIgnoredFilter;-><init>(I)V

    invoke-static {v1, v0}, Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter;->create(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v0

    .line 509
    :cond_3
    instance-of v1, p1, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    if-eqz v1, :cond_0

    .line 510
    new-instance v1, Lorg/eclipse/jgit/treewalk/filter/NotIgnoredFilter;

    invoke-direct {v1, v3}, Lorg/eclipse/jgit/treewalk/filter/NotIgnoredFilter;-><init>(I)V

    invoke-static {v1, v0}, Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter;->create(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v0

    goto :goto_0
.end method

.method private isAdd(Ljava/util/List;)Z
    .locals 5
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 528
    .local p1, files:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    iget-object v3, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->pathFilter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    check-cast v3, Lorg/eclipse/jgit/revwalk/FollowFilter;

    invoke-virtual {v3}, Lorg/eclipse/jgit/revwalk/FollowFilter;->getPath()Ljava/lang/String;

    move-result-object v2

    .line 529
    .local v2, oldPath:Ljava/lang/String;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/diff/DiffEntry;

    .line 530
    .local v0, ent:Lorg/eclipse/jgit/diff/DiffEntry;
    invoke-virtual {v0}, Lorg/eclipse/jgit/diff/DiffEntry;->getChangeType()Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    move-result-object v3

    sget-object v4, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->ADD:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    if-ne v3, v4, :cond_0

    invoke-virtual {v0}, Lorg/eclipse/jgit/diff/DiffEntry;->getNewPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 531
    const/4 v3, 0x1

    .line 533
    .end local v0           #ent:Lorg/eclipse/jgit/diff/DiffEntry;
    :goto_0
    return v3

    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private static isEndOfLineMissing(Lorg/eclipse/jgit/diff/RawText;I)Z
    .locals 2
    .parameter "text"
    .parameter "line"

    .prologue
    .line 761
    add-int/lit8 v0, p1, 0x1

    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/RawText;->size()I

    move-result v1

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/RawText;->isMissingNewlineAtEnd()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static isRename(Lorg/eclipse/jgit/diff/DiffEntry;)Z
    .locals 2
    .parameter "ent"

    .prologue
    .line 548
    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/DiffEntry;->getChangeType()Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    move-result-object v0

    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->RENAME:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    if-eq v0, v1, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/DiffEntry;->getChangeType()Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    move-result-object v0

    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->COPY:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private open(Lorg/eclipse/jgit/diff/DiffEntry$Side;Lorg/eclipse/jgit/diff/DiffEntry;)[B
    .locals 8
    .parameter "side"
    .parameter "entry"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x3

    .line 968
    invoke-virtual {p2, p1}, Lorg/eclipse/jgit/diff/DiffEntry;->getMode(Lorg/eclipse/jgit/diff/DiffEntry$Side;)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v5

    sget-object v6, Lorg/eclipse/jgit/lib/FileMode;->MISSING:Lorg/eclipse/jgit/lib/FileMode;

    if-ne v5, v6, :cond_0

    .line 969
    sget-object v5, Lorg/eclipse/jgit/diff/DiffFormatter;->EMPTY:[B

    .line 1004
    :goto_0
    return-object v5

    .line 971
    :cond_0
    invoke-virtual {p2, p1}, Lorg/eclipse/jgit/diff/DiffEntry;->getMode(Lorg/eclipse/jgit/diff/DiffEntry$Side;)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v5

    invoke-virtual {v5}, Lorg/eclipse/jgit/lib/FileMode;->getObjectType()I

    move-result v5

    if-eq v5, v7, :cond_1

    .line 972
    sget-object v5, Lorg/eclipse/jgit/diff/DiffFormatter;->EMPTY:[B

    goto :goto_0

    .line 974
    :cond_1
    invoke-virtual {p2, p1}, Lorg/eclipse/jgit/diff/DiffEntry;->getId(Lorg/eclipse/jgit/diff/DiffEntry$Side;)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v0

    .line 975
    .local v0, id:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->isComplete()Z

    move-result v5

    if-nez v5, :cond_2

    .line 976
    iget-object v5, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v5, v0}, Lorg/eclipse/jgit/lib/ObjectReader;->resolve(Lorg/eclipse/jgit/lib/AbbreviatedObjectId;)Ljava/util/Collection;

    move-result-object v1

    .line 977
    .local v1, ids:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_3

    .line 978
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/lib/AnyObjectId;

    invoke-static {v5}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->fromObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v0

    .line 979
    sget-object v5, Lorg/eclipse/jgit/diff/DiffFormatter$1;->$SwitchMap$org$eclipse$jgit$diff$DiffEntry$Side:[I

    invoke-virtual {p1}, Lorg/eclipse/jgit/diff/DiffEntry$Side;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_0

    .line 994
    .end local v1           #ids:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/ObjectId;>;"
    :cond_2
    :goto_1
    :try_start_0
    iget-object v5, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->source:Lorg/eclipse/jgit/diff/ContentSource$Pair;

    invoke-virtual {v5, p1, p2}, Lorg/eclipse/jgit/diff/ContentSource$Pair;->open(Lorg/eclipse/jgit/diff/DiffEntry$Side;Lorg/eclipse/jgit/diff/DiffEntry;)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v2

    .line 995
    .local v2, ldr:Lorg/eclipse/jgit/lib/ObjectLoader;
    iget v5, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->binaryFileThreshold:I

    invoke-virtual {v2, v5}, Lorg/eclipse/jgit/lib/ObjectLoader;->getBytes(I)[B
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsLimit; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsByteArrayLimit; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/eclipse/jgit/errors/LargeObjectException$OutOfMemory; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lorg/eclipse/jgit/errors/LargeObjectException; {:try_start_0 .. :try_end_0} :catch_3

    move-result-object v5

    goto :goto_0

    .line 981
    .end local v2           #ldr:Lorg/eclipse/jgit/lib/ObjectLoader;
    .restart local v1       #ids:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/ObjectId;>;"
    :pswitch_0
    iput-object v0, p2, Lorg/eclipse/jgit/diff/DiffEntry;->oldId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    goto :goto_1

    .line 984
    :pswitch_1
    iput-object v0, p2, Lorg/eclipse/jgit/diff/DiffEntry;->newId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    goto :goto_1

    .line 987
    :cond_3
    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v5

    if-nez v5, :cond_4

    .line 988
    new-instance v5, Lorg/eclipse/jgit/errors/MissingObjectException;

    invoke-direct {v5, v0, v7}, Lorg/eclipse/jgit/errors/MissingObjectException;-><init>(Lorg/eclipse/jgit/lib/AbbreviatedObjectId;I)V

    throw v5

    .line 990
    :cond_4
    new-instance v5, Lorg/eclipse/jgit/errors/AmbiguousObjectException;

    invoke-direct {v5, v0, v1}, Lorg/eclipse/jgit/errors/AmbiguousObjectException;-><init>(Lorg/eclipse/jgit/lib/AbbreviatedObjectId;Ljava/util/Collection;)V

    throw v5

    .line 997
    .end local v1           #ids:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/ObjectId;>;"
    :catch_0
    move-exception v3

    .line 998
    .local v3, overLimit:Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsLimit;
    sget-object v5, Lorg/eclipse/jgit/diff/DiffFormatter;->BINARY:[B

    goto :goto_0

    .line 1000
    .end local v3           #overLimit:Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsLimit;
    :catch_1
    move-exception v3

    .line 1001
    .local v3, overLimit:Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsByteArrayLimit;
    sget-object v5, Lorg/eclipse/jgit/diff/DiffFormatter;->BINARY:[B

    goto :goto_0

    .line 1003
    .end local v3           #overLimit:Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsByteArrayLimit;
    :catch_2
    move-exception v4

    .line 1004
    .local v4, tooBig:Lorg/eclipse/jgit/errors/LargeObjectException$OutOfMemory;
    sget-object v5, Lorg/eclipse/jgit/diff/DiffFormatter;->BINARY:[B

    goto :goto_0

    .line 1006
    .end local v4           #tooBig:Lorg/eclipse/jgit/errors/LargeObjectException$OutOfMemory;
    :catch_3
    move-exception v4

    .line 1007
    .local v4, tooBig:Lorg/eclipse/jgit/errors/LargeObjectException;
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/errors/LargeObjectException;->setObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 1008
    throw v4

    .line 979
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private static quotePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "name"

    .prologue
    .line 660
    sget-object v0, Lorg/eclipse/jgit/util/QuotedString;->GIT_PATH:Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;

    invoke-virtual {v0, p0}, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private source(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Lorg/eclipse/jgit/diff/ContentSource;
    .locals 1
    .parameter "iterator"

    .prologue
    .line 515
    instance-of v0, p1, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    if-eqz v0, :cond_0

    .line 516
    check-cast p1, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    .end local p1
    invoke-static {p1}, Lorg/eclipse/jgit/diff/ContentSource;->create(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;)Lorg/eclipse/jgit/diff/ContentSource;

    move-result-object v0

    .line 517
    :goto_0
    return-object v0

    .restart local p1
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-static {v0}, Lorg/eclipse/jgit/diff/ContentSource;->create(Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/diff/ContentSource;

    move-result-object v0

    goto :goto_0
.end method

.method private updateFollowFilter(Ljava/util/List;)Ljava/util/List;
    .locals 5
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 537
    .local p1, files:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    iget-object v3, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->pathFilter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    check-cast v3, Lorg/eclipse/jgit/revwalk/FollowFilter;

    invoke-virtual {v3}, Lorg/eclipse/jgit/revwalk/FollowFilter;->getPath()Ljava/lang/String;

    move-result-object v2

    .line 538
    .local v2, oldPath:Ljava/lang/String;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/diff/DiffEntry;

    .line 539
    .local v0, ent:Lorg/eclipse/jgit/diff/DiffEntry;
    invoke-static {v0}, Lorg/eclipse/jgit/diff/DiffFormatter;->isRename(Lorg/eclipse/jgit/diff/DiffEntry;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v0}, Lorg/eclipse/jgit/diff/DiffEntry;->getNewPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 540
    invoke-virtual {v0}, Lorg/eclipse/jgit/diff/DiffEntry;->getOldPath()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->diffCfg:Lorg/eclipse/jgit/diff/DiffConfig;

    invoke-static {v3, v4}, Lorg/eclipse/jgit/revwalk/FollowFilter;->create(Ljava/lang/String;Lorg/eclipse/jgit/diff/DiffConfig;)Lorg/eclipse/jgit/revwalk/FollowFilter;

    move-result-object v3

    iput-object v3, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->pathFilter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    .line 541
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    .line 544
    .end local v0           #ent:Lorg/eclipse/jgit/diff/DiffEntry;
    :goto_0
    return-object v3

    :cond_1
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v3

    goto :goto_0
.end method

.method private static writeGitLinkDiffText(Ljava/io/OutputStream;Lorg/eclipse/jgit/diff/DiffEntry;)V
    .locals 2
    .parameter "o"
    .parameter "ent"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 638
    invoke-virtual {p1}, Lorg/eclipse/jgit/diff/DiffEntry;->getOldMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v0

    sget-object v1, Lorg/eclipse/jgit/lib/FileMode;->GITLINK:Lorg/eclipse/jgit/lib/FileMode;

    if-ne v0, v1, :cond_0

    .line 639
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "-Subproject commit "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lorg/eclipse/jgit/diff/DiffEntry;->getOldId()Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write([B)V

    .line 642
    :cond_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/diff/DiffEntry;->getNewMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v0

    sget-object v1, Lorg/eclipse/jgit/lib/FileMode;->GITLINK:Lorg/eclipse/jgit/lib/FileMode;

    if-ne v0, v1, :cond_1

    .line 643
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "+Subproject commit "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lorg/eclipse/jgit/diff/DiffEntry;->getNewId()Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write([B)V

    .line 646
    :cond_1
    return-void
.end method

.method private writeRange(CII)V
    .locals 4
    .parameter "prefix"
    .parameter "begin"
    .parameter "cnt"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x2c

    .line 819
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->out:Ljava/io/OutputStream;

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 820
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 821
    packed-switch p3, :pswitch_data_0

    .line 840
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->out:Ljava/io/OutputStream;

    int-to-long v1, p2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(J)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 841
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, v3}, Ljava/io/OutputStream;->write(I)V

    .line 842
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->out:Ljava/io/OutputStream;

    int-to-long v1, p3

    invoke-static {v1, v2}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(J)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 845
    :goto_0
    return-void

    .line 828
    :pswitch_0
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->out:Ljava/io/OutputStream;

    add-int/lit8 v1, p2, -0x1

    int-to-long v1, v1

    invoke-static {v1, v2}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(J)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 829
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, v3}, Ljava/io/OutputStream;->write(I)V

    .line 830
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->out:Ljava/io/OutputStream;

    const/16 v1, 0x30

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    goto :goto_0

    .line 836
    :pswitch_1
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->out:Ljava/io/OutputStream;

    int-to-long v1, p2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(J)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    goto :goto_0

    .line 821
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 378
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 379
    return-void
.end method

.method public format(Ljava/util/List;)V
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 618
    .local p1, entries:Ljava/util/List;,"Ljava/util/List<+Lorg/eclipse/jgit/diff/DiffEntry;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/diff/DiffEntry;

    .line 619
    .local v0, ent:Lorg/eclipse/jgit/diff/DiffEntry;
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/diff/DiffFormatter;->format(Lorg/eclipse/jgit/diff/DiffEntry;)V

    goto :goto_0

    .line 620
    .end local v0           #ent:Lorg/eclipse/jgit/diff/DiffEntry;
    :cond_0
    return-void
.end method

.method public format(Lorg/eclipse/jgit/diff/DiffEntry;)V
    .locals 4
    .parameter "ent"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 632
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/diff/DiffFormatter;->createFormatResult(Lorg/eclipse/jgit/diff/DiffEntry;)Lorg/eclipse/jgit/diff/DiffFormatter$FormatResult;

    move-result-object v0

    .line 633
    .local v0, res:Lorg/eclipse/jgit/diff/DiffFormatter$FormatResult;
    iget-object v1, v0, Lorg/eclipse/jgit/diff/DiffFormatter$FormatResult;->header:Lorg/eclipse/jgit/patch/FileHeader;

    iget-object v2, v0, Lorg/eclipse/jgit/diff/DiffFormatter$FormatResult;->a:Lorg/eclipse/jgit/diff/RawText;

    iget-object v3, v0, Lorg/eclipse/jgit/diff/DiffFormatter$FormatResult;->b:Lorg/eclipse/jgit/diff/RawText;

    invoke-virtual {p0, v1, v2, v3}, Lorg/eclipse/jgit/diff/DiffFormatter;->format(Lorg/eclipse/jgit/patch/FileHeader;Lorg/eclipse/jgit/diff/RawText;Lorg/eclipse/jgit/diff/RawText;)V

    .line 634
    return-void
.end method

.method public format(Lorg/eclipse/jgit/diff/EditList;Lorg/eclipse/jgit/diff/RawText;Lorg/eclipse/jgit/diff/RawText;)V
    .locals 12
    .parameter "edits"
    .parameter "a"
    .parameter "b"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x0

    .line 709
    const/4 v5, 0x0

    .local v5, curIdx:I
    :cond_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/diff/EditList;->size()I

    move-result v8

    if-ge v5, v8, :cond_a

    .line 710
    invoke-virtual {p1, v5}, Lorg/eclipse/jgit/diff/EditList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/diff/Edit;

    .line 711
    .local v4, curEdit:Lorg/eclipse/jgit/diff/Edit;
    invoke-direct {p0, p1, v5}, Lorg/eclipse/jgit/diff/DiffFormatter;->findCombinedEnd(Ljava/util/List;I)I

    move-result v7

    .line 712
    .local v7, endIdx:I
    invoke-virtual {p1, v7}, Lorg/eclipse/jgit/diff/EditList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/eclipse/jgit/diff/Edit;

    .line 714
    .local v6, endEdit:Lorg/eclipse/jgit/diff/Edit;
    invoke-virtual {v4}, Lorg/eclipse/jgit/diff/Edit;->getBeginA()I

    move-result v8

    iget v9, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->context:I

    sub-int/2addr v8, v9

    invoke-static {v11, v8}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 715
    .local v0, aCur:I
    invoke-virtual {v4}, Lorg/eclipse/jgit/diff/Edit;->getBeginB()I

    move-result v8

    iget v9, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->context:I

    sub-int/2addr v8, v9

    invoke-static {v11, v8}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 716
    .local v2, bCur:I
    invoke-virtual {p2}, Lorg/eclipse/jgit/diff/RawText;->size()I

    move-result v8

    invoke-virtual {v6}, Lorg/eclipse/jgit/diff/Edit;->getEndA()I

    move-result v9

    iget v10, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->context:I

    add-int/2addr v9, v10

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 717
    .local v1, aEnd:I
    invoke-virtual {p3}, Lorg/eclipse/jgit/diff/RawText;->size()I

    move-result v8

    invoke-virtual {v6}, Lorg/eclipse/jgit/diff/Edit;->getEndB()I

    move-result v9

    iget v10, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->context:I

    add-int/2addr v9, v10

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 719
    .local v3, bEnd:I
    invoke-virtual {p0, v0, v1, v2, v3}, Lorg/eclipse/jgit/diff/DiffFormatter;->writeHunkHeader(IIII)V

    .line 721
    :cond_1
    :goto_0
    if-lt v0, v1, :cond_2

    if-ge v2, v3, :cond_0

    .line 722
    :cond_2
    invoke-virtual {v4}, Lorg/eclipse/jgit/diff/Edit;->getBeginA()I

    move-result v8

    if-lt v0, v8, :cond_3

    add-int/lit8 v8, v7, 0x1

    if-ge v8, v5, :cond_6

    .line 723
    :cond_3
    invoke-virtual {p0, p2, v0}, Lorg/eclipse/jgit/diff/DiffFormatter;->writeContextLine(Lorg/eclipse/jgit/diff/RawText;I)V

    .line 724
    invoke-static {p2, v0}, Lorg/eclipse/jgit/diff/DiffFormatter;->isEndOfLineMissing(Lorg/eclipse/jgit/diff/RawText;I)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 725
    iget-object v8, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->out:Ljava/io/OutputStream;

    sget-object v9, Lorg/eclipse/jgit/diff/DiffFormatter;->noNewLine:[B

    invoke-virtual {v8, v9}, Ljava/io/OutputStream;->write([B)V

    .line 726
    :cond_4
    add-int/lit8 v0, v0, 0x1

    .line 727
    add-int/lit8 v2, v2, 0x1

    .line 740
    :cond_5
    :goto_1
    invoke-static {v4, v0, v2}, Lorg/eclipse/jgit/diff/DiffFormatter;->end(Lorg/eclipse/jgit/diff/Edit;II)Z

    move-result v8

    if-eqz v8, :cond_1

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {p1}, Lorg/eclipse/jgit/diff/EditList;->size()I

    move-result v8

    if-ge v5, v8, :cond_1

    .line 741
    invoke-virtual {p1, v5}, Lorg/eclipse/jgit/diff/EditList;->get(I)Ljava/lang/Object;

    move-result-object v4

    .end local v4           #curEdit:Lorg/eclipse/jgit/diff/Edit;
    check-cast v4, Lorg/eclipse/jgit/diff/Edit;

    .restart local v4       #curEdit:Lorg/eclipse/jgit/diff/Edit;
    goto :goto_0

    .line 728
    :cond_6
    invoke-virtual {v4}, Lorg/eclipse/jgit/diff/Edit;->getEndA()I

    move-result v8

    if-ge v0, v8, :cond_8

    .line 729
    invoke-virtual {p0, p2, v0}, Lorg/eclipse/jgit/diff/DiffFormatter;->writeRemovedLine(Lorg/eclipse/jgit/diff/RawText;I)V

    .line 730
    invoke-static {p2, v0}, Lorg/eclipse/jgit/diff/DiffFormatter;->isEndOfLineMissing(Lorg/eclipse/jgit/diff/RawText;I)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 731
    iget-object v8, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->out:Ljava/io/OutputStream;

    sget-object v9, Lorg/eclipse/jgit/diff/DiffFormatter;->noNewLine:[B

    invoke-virtual {v8, v9}, Ljava/io/OutputStream;->write([B)V

    .line 732
    :cond_7
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 733
    :cond_8
    invoke-virtual {v4}, Lorg/eclipse/jgit/diff/Edit;->getEndB()I

    move-result v8

    if-ge v2, v8, :cond_5

    .line 734
    invoke-virtual {p0, p3, v2}, Lorg/eclipse/jgit/diff/DiffFormatter;->writeAddedLine(Lorg/eclipse/jgit/diff/RawText;I)V

    .line 735
    invoke-static {p3, v2}, Lorg/eclipse/jgit/diff/DiffFormatter;->isEndOfLineMissing(Lorg/eclipse/jgit/diff/RawText;I)Z

    move-result v8

    if-eqz v8, :cond_9

    .line 736
    iget-object v8, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->out:Ljava/io/OutputStream;

    sget-object v9, Lorg/eclipse/jgit/diff/DiffFormatter;->noNewLine:[B

    invoke-virtual {v8, v9}, Ljava/io/OutputStream;->write([B)V

    .line 737
    :cond_9
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 744
    .end local v0           #aCur:I
    .end local v1           #aEnd:I
    .end local v2           #bCur:I
    .end local v3           #bEnd:I
    .end local v4           #curEdit:Lorg/eclipse/jgit/diff/Edit;
    .end local v6           #endEdit:Lorg/eclipse/jgit/diff/Edit;
    .end local v7           #endIdx:I
    :cond_a
    return-void
.end method

.method public format(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 1
    .parameter "a"
    .parameter "b"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 566
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/diff/DiffFormatter;->scan(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/diff/DiffFormatter;->format(Ljava/util/List;)V

    .line 567
    return-void
.end method

.method public format(Lorg/eclipse/jgit/patch/FileHeader;Lorg/eclipse/jgit/diff/RawText;Lorg/eclipse/jgit/diff/RawText;)V
    .locals 5
    .parameter "head"
    .parameter "a"
    .parameter "b"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 687
    invoke-virtual {p1}, Lorg/eclipse/jgit/patch/FileHeader;->getStartOffset()I

    move-result v1

    .line 688
    .local v1, start:I
    invoke-virtual {p1}, Lorg/eclipse/jgit/patch/FileHeader;->getEndOffset()I

    move-result v0

    .line 689
    .local v0, end:I
    invoke-virtual {p1}, Lorg/eclipse/jgit/patch/FileHeader;->getHunks()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 690
    invoke-virtual {p1}, Lorg/eclipse/jgit/patch/FileHeader;->getHunks()Ljava/util/List;

    move-result-object v2

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/patch/HunkHeader;

    invoke-virtual {v2}, Lorg/eclipse/jgit/patch/HunkHeader;->getStartOffset()I

    move-result v0

    .line 691
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->out:Ljava/io/OutputStream;

    invoke-virtual {p1}, Lorg/eclipse/jgit/patch/FileHeader;->getBuffer()[B

    move-result-object v3

    sub-int v4, v0, v1

    invoke-virtual {v2, v3, v1, v4}, Ljava/io/OutputStream;->write([BII)V

    .line 692
    invoke-virtual {p1}, Lorg/eclipse/jgit/patch/FileHeader;->getPatchType()Lorg/eclipse/jgit/patch/FileHeader$PatchType;

    move-result-object v2

    sget-object v3, Lorg/eclipse/jgit/patch/FileHeader$PatchType;->UNIFIED:Lorg/eclipse/jgit/patch/FileHeader$PatchType;

    if-ne v2, v3, :cond_1

    .line 693
    invoke-virtual {p1}, Lorg/eclipse/jgit/patch/FileHeader;->toEditList()Lorg/eclipse/jgit/diff/EditList;

    move-result-object v2

    invoke-virtual {p0, v2, p2, p3}, Lorg/eclipse/jgit/diff/DiffFormatter;->format(Lorg/eclipse/jgit/diff/EditList;Lorg/eclipse/jgit/diff/RawText;Lorg/eclipse/jgit/diff/RawText;)V

    .line 694
    :cond_1
    return-void
.end method

.method public format(Lorg/eclipse/jgit/revwalk/RevTree;Lorg/eclipse/jgit/revwalk/RevTree;)V
    .locals 1
    .parameter "a"
    .parameter "b"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 584
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/diff/DiffFormatter;->scan(Lorg/eclipse/jgit/revwalk/RevTree;Lorg/eclipse/jgit/revwalk/RevTree;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/diff/DiffFormatter;->format(Ljava/util/List;)V

    .line 585
    return-void
.end method

.method public format(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)V
    .locals 1
    .parameter "a"
    .parameter "b"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 603
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/diff/DiffFormatter;->scan(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/diff/DiffFormatter;->format(Ljava/util/List;)V

    .line 604
    return-void
.end method

.method protected formatGitDiffFirstHeaderLine(Ljava/io/ByteArrayOutputStream;Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "o"
    .parameter "type"
    .parameter "oldPath"
    .parameter "newPath"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1029
    const-string v0, "diff --git "

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 1030
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->oldPrefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v0, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->ADD:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    if-ne p2, v0, :cond_0

    move-object v0, p4

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/eclipse/jgit/diff/DiffFormatter;->quotePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 1031
    const/16 v0, 0x20

    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1032
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->newPrefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->DELETE:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    if-ne p2, v1, :cond_1

    .end local p3
    :goto_1
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/eclipse/jgit/diff/DiffFormatter;->quotePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 1034
    const/16 v0, 0xa

    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1035
    return-void

    .restart local p3
    :cond_0
    move-object v0, p3

    .line 1030
    goto :goto_0

    :cond_1
    move-object p3, p4

    .line 1032
    goto :goto_1
.end method

.method protected formatIndexLine(Ljava/io/OutputStream;Lorg/eclipse/jgit/diff/DiffEntry;)V
    .locals 2
    .parameter "o"
    .parameter "ent"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1117
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "index "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2}, Lorg/eclipse/jgit/diff/DiffEntry;->getOldId()Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/eclipse/jgit/diff/DiffFormatter;->format(Lorg/eclipse/jgit/lib/AbbreviatedObjectId;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2}, Lorg/eclipse/jgit/diff/DiffEntry;->getNewId()Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/eclipse/jgit/diff/DiffFormatter;->format(Lorg/eclipse/jgit/lib/AbbreviatedObjectId;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 1121
    invoke-virtual {p2}, Lorg/eclipse/jgit/diff/DiffEntry;->getOldMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v0

    invoke-virtual {p2}, Lorg/eclipse/jgit/diff/DiffEntry;->getNewMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1122
    const/16 v0, 0x20

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 1123
    invoke-virtual {p2}, Lorg/eclipse/jgit/diff/DiffEntry;->getNewMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/lib/FileMode;->copyTo(Ljava/io/OutputStream;)V

    .line 1125
    :cond_0
    const/16 v0, 0xa

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 1126
    return-void
.end method

.method public getNewPrefix()Ljava/lang/String;
    .locals 1

    .prologue
    .line 310
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->newPrefix:Ljava/lang/String;

    return-object v0
.end method

.method public getOldPrefix()Ljava/lang/String;
    .locals 1

    .prologue
    .line 287
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->oldPrefix:Ljava/lang/String;

    return-object v0
.end method

.method protected getOutputStream()Ljava/io/OutputStream;
    .locals 1

    .prologue
    .line 160
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->out:Ljava/io/OutputStream;

    return-object v0
.end method

.method public getPathFilter()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    .locals 1

    .prologue
    .line 368
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->pathFilter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    return-object v0
.end method

.method public getRenameDetector()Lorg/eclipse/jgit/diff/RenameDetector;
    .locals 1

    .prologue
    .line 339
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->renameDetector:Lorg/eclipse/jgit/diff/RenameDetector;

    return-object v0
.end method

.method public isDetectRenames()Z
    .locals 1

    .prologue
    .line 315
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->renameDetector:Lorg/eclipse/jgit/diff/RenameDetector;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public release()V
    .locals 1

    .prologue
    .line 383
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    if-eqz v0, :cond_0

    .line 384
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    .line 385
    :cond_0
    return-void
.end method

.method public scan(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)Ljava/util/List;
    .locals 3
    .parameter "a"
    .parameter "b"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/AnyObjectId;",
            "Lorg/eclipse/jgit/lib/AnyObjectId;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 405
    invoke-direct {p0}, Lorg/eclipse/jgit/diff/DiffFormatter;->assertHaveRepository()V

    .line 407
    new-instance v0, Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v1, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 408
    .local v0, rw:Lorg/eclipse/jgit/revwalk/RevWalk;
    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseTree(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v1

    invoke-virtual {v0, p2}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseTree(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lorg/eclipse/jgit/diff/DiffFormatter;->scan(Lorg/eclipse/jgit/revwalk/RevTree;Lorg/eclipse/jgit/revwalk/RevTree;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public scan(Lorg/eclipse/jgit/revwalk/RevTree;Lorg/eclipse/jgit/revwalk/RevTree;)Ljava/util/List;
    .locals 3
    .parameter "a"
    .parameter "b"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/revwalk/RevTree;",
            "Lorg/eclipse/jgit/revwalk/RevTree;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 428
    invoke-direct {p0}, Lorg/eclipse/jgit/diff/DiffFormatter;->assertHaveRepository()V

    .line 430
    new-instance v0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    invoke-direct {v0}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;-><init>()V

    .line 431
    .local v0, aParser:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
    new-instance v1, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    invoke-direct {v1}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;-><init>()V

    .line 433
    .local v1, bParser:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
    iget-object v2, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v0, v2, p1}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->reset(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 434
    iget-object v2, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v1, v2, p2}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->reset(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 436
    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/diff/DiffFormatter;->scan(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Ljava/util/List;

    move-result-object v2

    return-object v2
.end method

.method public scan(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Ljava/util/List;
    .locals 7
    .parameter "a"
    .parameter "b"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;",
            "Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    .line 457
    invoke-direct {p0}, Lorg/eclipse/jgit/diff/DiffFormatter;->assertHaveRepository()V

    .line 459
    new-instance v2, Lorg/eclipse/jgit/treewalk/TreeWalk;

    iget-object v3, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/treewalk/TreeWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 460
    .local v2, walk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 461
    invoke-virtual {v2, p2}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 462
    invoke-virtual {v2, v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setRecursive(Z)V

    .line 464
    invoke-static {p1, p2}, Lorg/eclipse/jgit/diff/DiffFormatter;->getDiffTreeFilterFor(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v1

    .line 465
    .local v1, filter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    iget-object v3, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->pathFilter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    instance-of v3, v3, Lorg/eclipse/jgit/revwalk/FollowFilter;

    if-eqz v3, :cond_2

    .line 466
    iget-object v3, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->pathFilter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    check-cast v3, Lorg/eclipse/jgit/revwalk/FollowFilter;

    invoke-virtual {v3}, Lorg/eclipse/jgit/revwalk/FollowFilter;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->create(Ljava/lang/String;)Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    move-result-object v3

    invoke-static {v3, v1}, Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter;->create(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V

    .line 473
    :goto_0
    new-instance v3, Lorg/eclipse/jgit/diff/ContentSource$Pair;

    invoke-direct {p0, p1}, Lorg/eclipse/jgit/diff/DiffFormatter;->source(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Lorg/eclipse/jgit/diff/ContentSource;

    move-result-object v4

    invoke-direct {p0, p2}, Lorg/eclipse/jgit/diff/DiffFormatter;->source(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Lorg/eclipse/jgit/diff/ContentSource;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lorg/eclipse/jgit/diff/ContentSource$Pair;-><init>(Lorg/eclipse/jgit/diff/ContentSource;Lorg/eclipse/jgit/diff/ContentSource;)V

    iput-object v3, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->source:Lorg/eclipse/jgit/diff/ContentSource$Pair;

    .line 475
    invoke-static {v2}, Lorg/eclipse/jgit/diff/DiffEntry;->scan(Lorg/eclipse/jgit/treewalk/TreeWalk;)Ljava/util/List;

    move-result-object v0

    .line 476
    .local v0, files:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    iget-object v3, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->pathFilter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    instance-of v3, v3, Lorg/eclipse/jgit/revwalk/FollowFilter;

    if-eqz v3, :cond_3

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/diff/DiffFormatter;->isAdd(Ljava/util/List;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 481
    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->reset()V

    .line 482
    invoke-virtual {p2}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->reset()V

    .line 483
    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/TreeWalk;->reset()V

    .line 484
    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 485
    invoke-virtual {v2, p2}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 486
    invoke-virtual {v2, v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V

    .line 488
    iget-object v3, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->renameDetector:Lorg/eclipse/jgit/diff/RenameDetector;

    if-nez v3, :cond_0

    .line 489
    invoke-virtual {p0, v6}, Lorg/eclipse/jgit/diff/DiffFormatter;->setDetectRenames(Z)V

    .line 490
    :cond_0
    invoke-static {v2}, Lorg/eclipse/jgit/diff/DiffEntry;->scan(Lorg/eclipse/jgit/treewalk/TreeWalk;)Ljava/util/List;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/eclipse/jgit/diff/DiffFormatter;->detectRenames(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/eclipse/jgit/diff/DiffFormatter;->updateFollowFilter(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 495
    :cond_1
    :goto_1
    return-object v0

    .line 470
    .end local v0           #files:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    :cond_2
    iget-object v3, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->pathFilter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    invoke-static {v3, v1}, Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter;->create(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V

    goto :goto_0

    .line 492
    .restart local v0       #files:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    :cond_3
    iget-object v3, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->renameDetector:Lorg/eclipse/jgit/diff/RenameDetector;

    if-eqz v3, :cond_1

    .line 493
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/diff/DiffFormatter;->detectRenames(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    goto :goto_1
.end method

.method public setAbbreviationLength(I)V
    .locals 2
    .parameter "count"

    .prologue
    .line 219
    if-gez p1, :cond_0

    .line 220
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->abbreviationLengthMustBeNonNegative:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 222
    :cond_0
    iput p1, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->abbreviationLength:I

    .line 223
    return-void
.end method

.method public setBinaryFileThreshold(I)V
    .locals 0
    .parameter "threshold"

    .prologue
    .line 264
    iput p1, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->binaryFileThreshold:I

    .line 265
    return-void
.end method

.method public setContext(I)V
    .locals 2
    .parameter "lineCount"

    .prologue
    .line 206
    if-gez p1, :cond_0

    .line 207
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->contextMustBeNonNegative:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 209
    :cond_0
    iput p1, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->context:I

    .line 210
    return-void
.end method

.method public setDetectRenames(Z)V
    .locals 2
    .parameter "on"

    .prologue
    .line 330
    if-eqz p1, :cond_1

    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->renameDetector:Lorg/eclipse/jgit/diff/RenameDetector;

    if-nez v0, :cond_1

    .line 331
    invoke-direct {p0}, Lorg/eclipse/jgit/diff/DiffFormatter;->assertHaveRepository()V

    .line 332
    new-instance v0, Lorg/eclipse/jgit/diff/RenameDetector;

    iget-object v1, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/diff/RenameDetector;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    iput-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->renameDetector:Lorg/eclipse/jgit/diff/RenameDetector;

    .line 335
    :cond_0
    :goto_0
    return-void

    .line 333
    :cond_1
    if-nez p1, :cond_0

    .line 334
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->renameDetector:Lorg/eclipse/jgit/diff/RenameDetector;

    goto :goto_0
.end method

.method public setDiffAlgorithm(Lorg/eclipse/jgit/diff/DiffAlgorithm;)V
    .locals 0
    .parameter "alg"

    .prologue
    .line 233
    iput-object p1, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->diffAlgorithm:Lorg/eclipse/jgit/diff/DiffAlgorithm;

    .line 234
    return-void
.end method

.method public setDiffComparator(Lorg/eclipse/jgit/diff/RawTextComparator;)V
    .locals 0
    .parameter "cmp"

    .prologue
    .line 250
    iput-object p1, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->comparator:Lorg/eclipse/jgit/diff/RawTextComparator;

    .line 251
    return-void
.end method

.method public setNewPrefix(Ljava/lang/String;)V
    .locals 0
    .parameter "prefix"

    .prologue
    .line 300
    iput-object p1, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->newPrefix:Ljava/lang/String;

    .line 301
    return-void
.end method

.method public setOldPrefix(Ljava/lang/String;)V
    .locals 0
    .parameter "prefix"

    .prologue
    .line 277
    iput-object p1, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->oldPrefix:Ljava/lang/String;

    .line 278
    return-void
.end method

.method public setPathFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V
    .locals 0
    .parameter "filter"

    .prologue
    .line 363
    if-eqz p1, :cond_0

    .end local p1
    :goto_0
    iput-object p1, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->pathFilter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    .line 364
    return-void

    .line 363
    .restart local p1
    :cond_0
    sget-object p1, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->ALL:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    goto :goto_0
.end method

.method public setProgressMonitor(Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    .locals 0
    .parameter "pm"

    .prologue
    .line 349
    iput-object p1, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->progressMonitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    .line 350
    return-void
.end method

.method public setRepository(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 7
    .parameter "repository"

    .prologue
    .line 173
    iget-object v2, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    if-eqz v2, :cond_0

    .line 174
    iget-object v2, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    .line 176
    :cond_0
    iput-object p1, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->db:Lorg/eclipse/jgit/lib/Repository;

    .line 177
    iget-object v2, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/Repository;->newObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    .line 178
    iget-object v2, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v2

    sget-object v3, Lorg/eclipse/jgit/diff/DiffConfig;->KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/lib/StoredConfig;->get(Lorg/eclipse/jgit/lib/Config$SectionParser;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/diff/DiffConfig;

    iput-object v2, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->diffCfg:Lorg/eclipse/jgit/diff/DiffConfig;

    .line 180
    iget-object v2, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-static {v2}, Lorg/eclipse/jgit/diff/ContentSource;->create(Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/diff/ContentSource;

    move-result-object v0

    .line 181
    .local v0, cs:Lorg/eclipse/jgit/diff/ContentSource;
    new-instance v2, Lorg/eclipse/jgit/diff/ContentSource$Pair;

    invoke-direct {v2, v0, v0}, Lorg/eclipse/jgit/diff/ContentSource$Pair;-><init>(Lorg/eclipse/jgit/diff/ContentSource;Lorg/eclipse/jgit/diff/ContentSource;)V

    iput-object v2, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->source:Lorg/eclipse/jgit/diff/ContentSource$Pair;

    .line 183
    iget-object v2, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v2

    sget-object v3, Lorg/eclipse/jgit/diff/DiffConfig;->KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/lib/StoredConfig;->get(Lorg/eclipse/jgit/lib/Config$SectionParser;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/diff/DiffConfig;

    .line 184
    .local v1, dc:Lorg/eclipse/jgit/diff/DiffConfig;
    invoke-virtual {v1}, Lorg/eclipse/jgit/diff/DiffConfig;->isNoPrefix()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 185
    const-string v2, ""

    invoke-virtual {p0, v2}, Lorg/eclipse/jgit/diff/DiffFormatter;->setOldPrefix(Ljava/lang/String;)V

    .line 186
    const-string v2, ""

    invoke-virtual {p0, v2}, Lorg/eclipse/jgit/diff/DiffFormatter;->setNewPrefix(Ljava/lang/String;)V

    .line 188
    :cond_1
    invoke-virtual {v1}, Lorg/eclipse/jgit/diff/DiffConfig;->isRenameDetectionEnabled()Z

    move-result v2

    invoke-virtual {p0, v2}, Lorg/eclipse/jgit/diff/DiffFormatter;->setDetectRenames(Z)V

    .line 190
    iget-object v2, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v2

    const-string v3, "diff"

    const/4 v4, 0x0

    const-string v5, "algorithm"

    sget-object v6, Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;->HISTOGRAM:Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;

    invoke-virtual {v2, v3, v4, v5, v6}, Lorg/eclipse/jgit/lib/StoredConfig;->getEnum(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Enum;)Ljava/lang/Enum;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;

    invoke-static {v2}, Lorg/eclipse/jgit/diff/DiffAlgorithm;->getAlgorithm(Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;)Lorg/eclipse/jgit/diff/DiffAlgorithm;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->diffAlgorithm:Lorg/eclipse/jgit/diff/DiffAlgorithm;

    .line 195
    return-void
.end method

.method public toFileHeader(Lorg/eclipse/jgit/diff/DiffEntry;)Lorg/eclipse/jgit/patch/FileHeader;
    .locals 1
    .parameter "ent"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Lorg/eclipse/jgit/errors/MissingObjectException;
        }
    .end annotation

    .prologue
    .line 889
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/diff/DiffFormatter;->createFormatResult(Lorg/eclipse/jgit/diff/DiffEntry;)Lorg/eclipse/jgit/diff/DiffFormatter$FormatResult;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/diff/DiffFormatter$FormatResult;->header:Lorg/eclipse/jgit/patch/FileHeader;

    return-object v0
.end method

.method protected writeAddedLine(Lorg/eclipse/jgit/diff/RawText;I)V
    .locals 1
    .parameter "text"
    .parameter "line"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 775
    const/16 v0, 0x2b

    invoke-virtual {p0, v0, p1, p2}, Lorg/eclipse/jgit/diff/DiffFormatter;->writeLine(CLorg/eclipse/jgit/diff/RawText;I)V

    .line 776
    return-void
.end method

.method protected writeContextLine(Lorg/eclipse/jgit/diff/RawText;I)V
    .locals 1
    .parameter "text"
    .parameter "line"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 757
    const/16 v0, 0x20

    invoke-virtual {p0, v0, p1, p2}, Lorg/eclipse/jgit/diff/DiffFormatter;->writeLine(CLorg/eclipse/jgit/diff/RawText;I)V

    .line 758
    return-void
.end method

.method protected writeHunkHeader(IIII)V
    .locals 4
    .parameter "aStartLine"
    .parameter "aEndLine"
    .parameter "bStartLine"
    .parameter "bEndLine"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x40

    .line 807
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, v3}, Ljava/io/OutputStream;->write(I)V

    .line 808
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, v3}, Ljava/io/OutputStream;->write(I)V

    .line 809
    const/16 v0, 0x2d

    add-int/lit8 v1, p1, 0x1

    sub-int v2, p2, p1

    invoke-direct {p0, v0, v1, v2}, Lorg/eclipse/jgit/diff/DiffFormatter;->writeRange(CII)V

    .line 810
    const/16 v0, 0x2b

    add-int/lit8 v1, p3, 0x1

    sub-int v2, p4, p3

    invoke-direct {p0, v0, v1, v2}, Lorg/eclipse/jgit/diff/DiffFormatter;->writeRange(CII)V

    .line 811
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->out:Ljava/io/OutputStream;

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 812
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, v3}, Ljava/io/OutputStream;->write(I)V

    .line 813
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, v3}, Ljava/io/OutputStream;->write(I)V

    .line 814
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->out:Ljava/io/OutputStream;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 815
    return-void
.end method

.method protected writeLine(CLorg/eclipse/jgit/diff/RawText;I)V
    .locals 2
    .parameter "prefix"
    .parameter "text"
    .parameter "cur"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 861
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 862
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->out:Ljava/io/OutputStream;

    invoke-virtual {p2, v0, p3}, Lorg/eclipse/jgit/diff/RawText;->writeLine(Ljava/io/OutputStream;I)V

    .line 863
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffFormatter;->out:Ljava/io/OutputStream;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 864
    return-void
.end method

.method protected writeRemovedLine(Lorg/eclipse/jgit/diff/RawText;I)V
    .locals 1
    .parameter "text"
    .parameter "line"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 789
    const/16 v0, 0x2d

    invoke-virtual {p0, v0, p1, p2}, Lorg/eclipse/jgit/diff/DiffFormatter;->writeLine(CLorg/eclipse/jgit/diff/RawText;I)V

    .line 790
    return-void
.end method
