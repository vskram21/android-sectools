.class Lorg/eclipse/jgit/notes/NonNoteEntry;
.super Lorg/eclipse/jgit/lib/ObjectId;
.source "NonNoteEntry.java"


# instance fields
.field private final mode:Lorg/eclipse/jgit/lib/FileMode;

.field private final name:[B

.field next:Lorg/eclipse/jgit/notes/NonNoteEntry;


# direct methods
.method constructor <init>([BLorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 0
    .parameter "name"
    .parameter "mode"
    .parameter "id"

    .prologue
    .line 63
    invoke-direct {p0, p3}, Lorg/eclipse/jgit/lib/ObjectId;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 64
    iput-object p1, p0, Lorg/eclipse/jgit/notes/NonNoteEntry;->name:[B

    .line 65
    iput-object p2, p0, Lorg/eclipse/jgit/notes/NonNoteEntry;->mode:Lorg/eclipse/jgit/lib/FileMode;

    .line 66
    return-void
.end method

.method private static lastPathChar(Lorg/eclipse/jgit/lib/FileMode;)I
    .locals 2
    .parameter "mode"

    .prologue
    .line 98
    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/FileMode;->getBits()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/FileMode;->equals(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x2f

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static pathCompare([BIILorg/eclipse/jgit/lib/FileMode;[BIILorg/eclipse/jgit/lib/FileMode;)I
    .locals 5
    .parameter "aBuf"
    .parameter "aPos"
    .parameter "aEnd"
    .parameter "aMode"
    .parameter "bBuf"
    .parameter "bPos"
    .parameter "bEnd"
    .parameter "bMode"

    .prologue
    .line 84
    move v1, p5

    .end local p5
    .local v1, bPos:I
    move v0, p1

    .end local p1
    .local v0, aPos:I
    :goto_0
    if-ge v0, p2, :cond_1

    if-ge v1, p6, :cond_1

    .line 85
    add-int/lit8 p1, v0, 0x1

    .end local v0           #aPos:I
    .restart local p1
    aget-byte v3, p0, v0

    and-int/lit16 v3, v3, 0xff

    add-int/lit8 p5, v1, 0x1

    .end local v1           #bPos:I
    .restart local p5
    aget-byte v4, p4, v1

    and-int/lit16 v4, v4, 0xff

    sub-int v2, v3, v4

    .line 86
    .local v2, cmp:I
    if-eqz v2, :cond_0

    .line 94
    .end local v2           #cmp:I
    :goto_1
    return v2

    .restart local v2       #cmp:I
    :cond_0
    move v1, p5

    .end local p5
    .restart local v1       #bPos:I
    move v0, p1

    .line 88
    .end local p1
    .restart local v0       #aPos:I
    goto :goto_0

    .line 90
    .end local v2           #cmp:I
    :cond_1
    if-ge v0, p2, :cond_2

    .line 91
    aget-byte v3, p0, v0

    and-int/lit16 v3, v3, 0xff

    invoke-static {p7}, Lorg/eclipse/jgit/notes/NonNoteEntry;->lastPathChar(Lorg/eclipse/jgit/lib/FileMode;)I

    move-result v4

    sub-int v2, v3, v4

    move p5, v1

    .end local v1           #bPos:I
    .restart local p5
    move p1, v0

    .end local v0           #aPos:I
    .restart local p1
    goto :goto_1

    .line 92
    .end local p1
    .end local p5
    .restart local v0       #aPos:I
    .restart local v1       #bPos:I
    :cond_2
    if-ge v1, p6, :cond_3

    .line 93
    invoke-static {p3}, Lorg/eclipse/jgit/notes/NonNoteEntry;->lastPathChar(Lorg/eclipse/jgit/lib/FileMode;)I

    move-result v3

    aget-byte v4, p4, v1

    and-int/lit16 v4, v4, 0xff

    sub-int v2, v3, v4

    move p5, v1

    .end local v1           #bPos:I
    .restart local p5
    move p1, v0

    .end local v0           #aPos:I
    .restart local p1
    goto :goto_1

    .line 94
    .end local p1
    .end local p5
    .restart local v0       #aPos:I
    .restart local v1       #bPos:I
    :cond_3
    const/4 v2, 0x0

    move p5, v1

    .end local v1           #bPos:I
    .restart local p5
    move p1, v0

    .end local v0           #aPos:I
    .restart local p1
    goto :goto_1
.end method


# virtual methods
.method format(Lorg/eclipse/jgit/lib/TreeFormatter;)V
    .locals 2
    .parameter "fmt"

    .prologue
    .line 69
    iget-object v0, p0, Lorg/eclipse/jgit/notes/NonNoteEntry;->name:[B

    iget-object v1, p0, Lorg/eclipse/jgit/notes/NonNoteEntry;->mode:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {p1, v0, v1, p0}, Lorg/eclipse/jgit/lib/TreeFormatter;->append([BLorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 70
    return-void
.end method

.method pathCompare([BIILorg/eclipse/jgit/lib/FileMode;)I
    .locals 8
    .parameter "bBuf"
    .parameter "bPos"
    .parameter "bLen"
    .parameter "bMode"

    .prologue
    .line 77
    iget-object v0, p0, Lorg/eclipse/jgit/notes/NonNoteEntry;->name:[B

    const/4 v1, 0x0

    iget-object v2, p0, Lorg/eclipse/jgit/notes/NonNoteEntry;->name:[B

    array-length v2, v2

    iget-object v3, p0, Lorg/eclipse/jgit/notes/NonNoteEntry;->mode:Lorg/eclipse/jgit/lib/FileMode;

    move-object v4, p1

    move v5, p2

    move v6, p3

    move-object v7, p4

    invoke-static/range {v0 .. v7}, Lorg/eclipse/jgit/notes/NonNoteEntry;->pathCompare([BIILorg/eclipse/jgit/lib/FileMode;[BIILorg/eclipse/jgit/lib/FileMode;)I

    move-result v0

    return v0
.end method

.method treeEntrySize()I
    .locals 2

    .prologue
    .line 73
    iget-object v0, p0, Lorg/eclipse/jgit/notes/NonNoteEntry;->mode:Lorg/eclipse/jgit/lib/FileMode;

    iget-object v1, p0, Lorg/eclipse/jgit/notes/NonNoteEntry;->name:[B

    array-length v1, v1

    invoke-static {v0, v1}, Lorg/eclipse/jgit/lib/TreeFormatter;->entrySize(Lorg/eclipse/jgit/lib/FileMode;I)I

    move-result v0

    return v0
.end method
