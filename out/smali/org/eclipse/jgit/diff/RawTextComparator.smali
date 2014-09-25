.class public abstract Lorg/eclipse/jgit/diff/RawTextComparator;
.super Lorg/eclipse/jgit/diff/SequenceComparator;
.source "RawTextComparator.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/diff/SequenceComparator",
        "<",
        "Lorg/eclipse/jgit/diff/RawText;",
        ">;"
    }
.end annotation


# static fields
.field public static final DEFAULT:Lorg/eclipse/jgit/diff/RawTextComparator;

.field public static final WS_IGNORE_ALL:Lorg/eclipse/jgit/diff/RawTextComparator;

.field public static final WS_IGNORE_CHANGE:Lorg/eclipse/jgit/diff/RawTextComparator;

.field public static final WS_IGNORE_LEADING:Lorg/eclipse/jgit/diff/RawTextComparator;

.field public static final WS_IGNORE_TRAILING:Lorg/eclipse/jgit/diff/RawTextComparator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 56
    new-instance v0, Lorg/eclipse/jgit/diff/RawTextComparator$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/diff/RawTextComparator$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/diff/RawTextComparator;->DEFAULT:Lorg/eclipse/jgit/diff/RawTextComparator;

    .line 87
    new-instance v0, Lorg/eclipse/jgit/diff/RawTextComparator$2;

    invoke-direct {v0}, Lorg/eclipse/jgit/diff/RawTextComparator$2;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/diff/RawTextComparator;->WS_IGNORE_ALL:Lorg/eclipse/jgit/diff/RawTextComparator;

    .line 138
    new-instance v0, Lorg/eclipse/jgit/diff/RawTextComparator$3;

    invoke-direct {v0}, Lorg/eclipse/jgit/diff/RawTextComparator$3;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/diff/RawTextComparator;->WS_IGNORE_LEADING:Lorg/eclipse/jgit/diff/RawTextComparator;

    .line 173
    new-instance v0, Lorg/eclipse/jgit/diff/RawTextComparator$4;

    invoke-direct {v0}, Lorg/eclipse/jgit/diff/RawTextComparator$4;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/diff/RawTextComparator;->WS_IGNORE_TRAILING:Lorg/eclipse/jgit/diff/RawTextComparator;

    .line 208
    new-instance v0, Lorg/eclipse/jgit/diff/RawTextComparator$5;

    invoke-direct {v0}, Lorg/eclipse/jgit/diff/RawTextComparator$5;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/diff/RawTextComparator;->WS_IGNORE_CHANGE:Lorg/eclipse/jgit/diff/RawTextComparator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 54
    invoke-direct {p0}, Lorg/eclipse/jgit/diff/SequenceComparator;-><init>()V

    return-void
.end method

.method private static findForwardLine(Lorg/eclipse/jgit/util/IntList;II)I
    .locals 2
    .parameter "lines"
    .parameter "idx"
    .parameter "ptr"

    .prologue
    .line 320
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/IntList;->size()I

    move-result v1

    add-int/lit8 v0, v1, -0x2

    .line 321
    .local v0, end:I
    :goto_0
    if-ge p1, v0, :cond_0

    add-int/lit8 v1, p1, 0x2

    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/util/IntList;->get(I)I

    move-result v1

    if-ge v1, p2, :cond_0

    .line 322
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 323
    :cond_0
    return p1
.end method

.method private static findReverseLine(Lorg/eclipse/jgit/util/IntList;II)I
    .locals 1
    .parameter "lines"
    .parameter "idx"
    .parameter "ptr"

    .prologue
    .line 327
    :goto_0
    if-lez p1, :cond_0

    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/util/IntList;->get(I)I

    move-result v0

    if-gt p2, v0, :cond_0

    .line 328
    add-int/lit8 p1, p1, -0x1

    goto :goto_0

    .line 329
    :cond_0
    return p1
.end method


# virtual methods
.method public hash(Lorg/eclipse/jgit/diff/RawText;I)I
    .locals 4
    .parameter "seq"
    .parameter "lno"

    .prologue
    .line 260
    iget-object v2, p1, Lorg/eclipse/jgit/diff/RawText;->lines:Lorg/eclipse/jgit/util/IntList;

    add-int/lit8 v3, p2, 0x1

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/util/IntList;->get(I)I

    move-result v0

    .line 261
    .local v0, begin:I
    iget-object v2, p1, Lorg/eclipse/jgit/diff/RawText;->lines:Lorg/eclipse/jgit/util/IntList;

    add-int/lit8 v3, p2, 0x2

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/util/IntList;->get(I)I

    move-result v1

    .line 262
    .local v1, end:I
    iget-object v2, p1, Lorg/eclipse/jgit/diff/RawText;->content:[B

    invoke-virtual {p0, v2, v0, v1}, Lorg/eclipse/jgit/diff/RawTextComparator;->hashRegion([BII)I

    move-result v2

    return v2
.end method

.method public bridge synthetic hash(Lorg/eclipse/jgit/diff/Sequence;I)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 54
    check-cast p1, Lorg/eclipse/jgit/diff/RawText;

    .end local p1
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/diff/RawTextComparator;->hash(Lorg/eclipse/jgit/diff/RawText;I)I

    move-result v0

    return v0
.end method

.method protected abstract hashRegion([BII)I
.end method

.method public reduceCommonStartEnd(Lorg/eclipse/jgit/diff/RawText;Lorg/eclipse/jgit/diff/RawText;Lorg/eclipse/jgit/diff/Edit;)Lorg/eclipse/jgit/diff/Edit;
    .locals 9
    .parameter "a"
    .parameter "b"
    .parameter "e"

    .prologue
    .line 273
    iget v7, p3, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    iget v8, p3, Lorg/eclipse/jgit/diff/Edit;->endA:I

    if-eq v7, v8, :cond_0

    iget v7, p3, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    iget v8, p3, Lorg/eclipse/jgit/diff/Edit;->endB:I

    if-ne v7, v8, :cond_1

    .line 316
    .end local p3
    :cond_0
    :goto_0
    return-object p3

    .line 276
    .restart local p3
    :cond_1
    iget-object v2, p1, Lorg/eclipse/jgit/diff/RawText;->content:[B

    .line 277
    .local v2, aRaw:[B
    iget-object v5, p2, Lorg/eclipse/jgit/diff/RawText;->content:[B

    .line 279
    .local v5, bRaw:[B
    iget-object v7, p1, Lorg/eclipse/jgit/diff/RawText;->lines:Lorg/eclipse/jgit/util/IntList;

    iget v8, p3, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    add-int/lit8 v8, v8, 0x1

    invoke-virtual {v7, v8}, Lorg/eclipse/jgit/util/IntList;->get(I)I

    move-result v1

    .line 280
    .local v1, aPtr:I
    iget-object v7, p1, Lorg/eclipse/jgit/diff/RawText;->lines:Lorg/eclipse/jgit/util/IntList;

    iget v8, p3, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    add-int/lit8 v8, v8, 0x1

    invoke-virtual {v7, v8}, Lorg/eclipse/jgit/util/IntList;->get(I)I

    move-result v4

    .line 282
    .local v4, bPtr:I
    iget-object v7, p1, Lorg/eclipse/jgit/diff/RawText;->lines:Lorg/eclipse/jgit/util/IntList;

    iget v8, p3, Lorg/eclipse/jgit/diff/Edit;->endA:I

    add-int/lit8 v8, v8, 0x1

    invoke-virtual {v7, v8}, Lorg/eclipse/jgit/util/IntList;->get(I)I

    move-result v0

    .line 283
    .local v0, aEnd:I
    iget-object v7, p2, Lorg/eclipse/jgit/diff/RawText;->lines:Lorg/eclipse/jgit/util/IntList;

    iget v8, p3, Lorg/eclipse/jgit/diff/Edit;->endB:I

    add-int/lit8 v8, v8, 0x1

    invoke-virtual {v7, v8}, Lorg/eclipse/jgit/util/IntList;->get(I)I

    move-result v3

    .line 289
    .local v3, bEnd:I
    if-ltz v1, :cond_2

    if-ltz v4, :cond_2

    array-length v7, v2

    if-gt v0, v7, :cond_2

    array-length v7, v5

    if-le v3, v7, :cond_3

    .line 290
    :cond_2
    new-instance v7, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v7}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v7

    .line 292
    :cond_3
    :goto_1
    if-ge v1, v0, :cond_4

    if-ge v4, v3, :cond_4

    aget-byte v7, v2, v1

    aget-byte v8, v5, v4

    if-ne v7, v8, :cond_4

    .line 293
    add-int/lit8 v1, v1, 0x1

    .line 294
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 297
    :cond_4
    :goto_2
    if-ge v1, v0, :cond_5

    if-ge v4, v3, :cond_5

    add-int/lit8 v7, v0, -0x1

    aget-byte v7, v2, v7

    add-int/lit8 v8, v3, -0x1

    aget-byte v8, v5, v8

    if-ne v7, v8, :cond_5

    .line 298
    add-int/lit8 v0, v0, -0x1

    .line 299
    add-int/lit8 v3, v3, -0x1

    goto :goto_2

    .line 302
    :cond_5
    iget-object v7, p1, Lorg/eclipse/jgit/diff/RawText;->lines:Lorg/eclipse/jgit/util/IntList;

    iget v8, p3, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    invoke-static {v7, v8, v1}, Lorg/eclipse/jgit/diff/RawTextComparator;->findForwardLine(Lorg/eclipse/jgit/util/IntList;II)I

    move-result v7

    iput v7, p3, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    .line 303
    iget-object v7, p2, Lorg/eclipse/jgit/diff/RawText;->lines:Lorg/eclipse/jgit/util/IntList;

    iget v8, p3, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    invoke-static {v7, v8, v4}, Lorg/eclipse/jgit/diff/RawTextComparator;->findForwardLine(Lorg/eclipse/jgit/util/IntList;II)I

    move-result v7

    iput v7, p3, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    .line 305
    iget-object v7, p1, Lorg/eclipse/jgit/diff/RawText;->lines:Lorg/eclipse/jgit/util/IntList;

    iget v8, p3, Lorg/eclipse/jgit/diff/Edit;->endA:I

    invoke-static {v7, v8, v0}, Lorg/eclipse/jgit/diff/RawTextComparator;->findReverseLine(Lorg/eclipse/jgit/util/IntList;II)I

    move-result v7

    iput v7, p3, Lorg/eclipse/jgit/diff/Edit;->endA:I

    .line 307
    iget-object v7, p1, Lorg/eclipse/jgit/diff/RawText;->lines:Lorg/eclipse/jgit/util/IntList;

    iget v8, p3, Lorg/eclipse/jgit/diff/Edit;->endA:I

    add-int/lit8 v8, v8, 0x1

    invoke-virtual {v7, v8}, Lorg/eclipse/jgit/util/IntList;->get(I)I

    move-result v7

    if-ge v0, v7, :cond_8

    const/4 v6, 0x1

    .line 308
    .local v6, partialA:Z
    :goto_3
    if-eqz v6, :cond_6

    .line 309
    iget-object v7, p1, Lorg/eclipse/jgit/diff/RawText;->lines:Lorg/eclipse/jgit/util/IntList;

    iget v8, p3, Lorg/eclipse/jgit/diff/Edit;->endA:I

    add-int/lit8 v8, v8, 0x1

    invoke-virtual {v7, v8}, Lorg/eclipse/jgit/util/IntList;->get(I)I

    move-result v7

    sub-int/2addr v7, v0

    add-int/2addr v3, v7

    .line 311
    :cond_6
    iget-object v7, p2, Lorg/eclipse/jgit/diff/RawText;->lines:Lorg/eclipse/jgit/util/IntList;

    iget v8, p3, Lorg/eclipse/jgit/diff/Edit;->endB:I

    invoke-static {v7, v8, v3}, Lorg/eclipse/jgit/diff/RawTextComparator;->findReverseLine(Lorg/eclipse/jgit/util/IntList;II)I

    move-result v7

    iput v7, p3, Lorg/eclipse/jgit/diff/Edit;->endB:I

    .line 313
    if-nez v6, :cond_7

    iget-object v7, p2, Lorg/eclipse/jgit/diff/RawText;->lines:Lorg/eclipse/jgit/util/IntList;

    iget v8, p3, Lorg/eclipse/jgit/diff/Edit;->endB:I

    add-int/lit8 v8, v8, 0x1

    invoke-virtual {v7, v8}, Lorg/eclipse/jgit/util/IntList;->get(I)I

    move-result v7

    if-ge v3, v7, :cond_7

    .line 314
    iget v7, p3, Lorg/eclipse/jgit/diff/Edit;->endA:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p3, Lorg/eclipse/jgit/diff/Edit;->endA:I

    .line 316
    :cond_7
    invoke-super {p0, p1, p2, p3}, Lorg/eclipse/jgit/diff/SequenceComparator;->reduceCommonStartEnd(Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Edit;)Lorg/eclipse/jgit/diff/Edit;

    move-result-object p3

    goto/16 :goto_0

    .line 307
    .end local v6           #partialA:Z
    :cond_8
    const/4 v6, 0x0

    goto :goto_3
.end method

.method public bridge synthetic reduceCommonStartEnd(Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Edit;)Lorg/eclipse/jgit/diff/Edit;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 54
    check-cast p1, Lorg/eclipse/jgit/diff/RawText;

    .end local p1
    check-cast p2, Lorg/eclipse/jgit/diff/RawText;

    .end local p2
    invoke-virtual {p0, p1, p2, p3}, Lorg/eclipse/jgit/diff/RawTextComparator;->reduceCommonStartEnd(Lorg/eclipse/jgit/diff/RawText;Lorg/eclipse/jgit/diff/RawText;Lorg/eclipse/jgit/diff/Edit;)Lorg/eclipse/jgit/diff/Edit;

    move-result-object v0

    return-object v0
.end method
