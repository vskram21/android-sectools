.class Lorg/eclipse/jgit/blame/Region;
.super Ljava/lang/Object;
.source "Region.java"


# instance fields
.field length:I

.field next:Lorg/eclipse/jgit/blame/Region;

.field resultStart:I

.field sourceStart:I


# direct methods
.method constructor <init>(III)V
    .locals 0
    .parameter "rs"
    .parameter "ss"
    .parameter "len"

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    iput p1, p0, Lorg/eclipse/jgit/blame/Region;->resultStart:I

    .line 68
    iput p2, p0, Lorg/eclipse/jgit/blame/Region;->sourceStart:I

    .line 69
    iput p3, p0, Lorg/eclipse/jgit/blame/Region;->length:I

    .line 70
    return-void
.end method


# virtual methods
.method copy(I)Lorg/eclipse/jgit/blame/Region;
    .locals 3
    .parameter "newSource"

    .prologue
    .line 80
    new-instance v0, Lorg/eclipse/jgit/blame/Region;

    iget v1, p0, Lorg/eclipse/jgit/blame/Region;->resultStart:I

    iget v2, p0, Lorg/eclipse/jgit/blame/Region;->length:I

    invoke-direct {v0, v1, p1, v2}, Lorg/eclipse/jgit/blame/Region;-><init>(III)V

    return-object v0
.end method

.method deepCopy()Lorg/eclipse/jgit/blame/Region;
    .locals 7

    .prologue
    .line 109
    new-instance v0, Lorg/eclipse/jgit/blame/Region;

    iget v4, p0, Lorg/eclipse/jgit/blame/Region;->resultStart:I

    iget v5, p0, Lorg/eclipse/jgit/blame/Region;->sourceStart:I

    iget v6, p0, Lorg/eclipse/jgit/blame/Region;->length:I

    invoke-direct {v0, v4, v5, v6}, Lorg/eclipse/jgit/blame/Region;-><init>(III)V

    .line 110
    .local v0, head:Lorg/eclipse/jgit/blame/Region;
    move-object v3, v0

    .line 111
    .local v3, tail:Lorg/eclipse/jgit/blame/Region;
    iget-object v1, p0, Lorg/eclipse/jgit/blame/Region;->next:Lorg/eclipse/jgit/blame/Region;

    .local v1, n:Lorg/eclipse/jgit/blame/Region;
    :goto_0
    if-eqz v1, :cond_0

    .line 112
    new-instance v2, Lorg/eclipse/jgit/blame/Region;

    iget v4, v1, Lorg/eclipse/jgit/blame/Region;->resultStart:I

    iget v5, v1, Lorg/eclipse/jgit/blame/Region;->sourceStart:I

    iget v6, v1, Lorg/eclipse/jgit/blame/Region;->length:I

    invoke-direct {v2, v4, v5, v6}, Lorg/eclipse/jgit/blame/Region;-><init>(III)V

    .line 113
    .local v2, q:Lorg/eclipse/jgit/blame/Region;
    iput-object v2, v3, Lorg/eclipse/jgit/blame/Region;->next:Lorg/eclipse/jgit/blame/Region;

    .line 114
    move-object v3, v2

    .line 111
    iget-object v1, v1, Lorg/eclipse/jgit/blame/Region;->next:Lorg/eclipse/jgit/blame/Region;

    goto :goto_0

    .line 116
    .end local v2           #q:Lorg/eclipse/jgit/blame/Region;
    :cond_0
    return-object v0
.end method

.method slideAndShrink(I)V
    .locals 1
    .parameter "d"

    .prologue
    .line 103
    iget v0, p0, Lorg/eclipse/jgit/blame/Region;->resultStart:I

    add-int/2addr v0, p1

    iput v0, p0, Lorg/eclipse/jgit/blame/Region;->resultStart:I

    .line 104
    iget v0, p0, Lorg/eclipse/jgit/blame/Region;->sourceStart:I

    add-int/2addr v0, p1

    iput v0, p0, Lorg/eclipse/jgit/blame/Region;->sourceStart:I

    .line 105
    iget v0, p0, Lorg/eclipse/jgit/blame/Region;->length:I

    sub-int/2addr v0, p1

    iput v0, p0, Lorg/eclipse/jgit/blame/Region;->length:I

    .line 106
    return-void
.end method

.method splitFirst(II)Lorg/eclipse/jgit/blame/Region;
    .locals 2
    .parameter "newSource"
    .parameter "newLen"

    .prologue
    .line 93
    new-instance v0, Lorg/eclipse/jgit/blame/Region;

    iget v1, p0, Lorg/eclipse/jgit/blame/Region;->resultStart:I

    invoke-direct {v0, v1, p1, p2}, Lorg/eclipse/jgit/blame/Region;-><init>(III)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 121
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 122
    .local v0, buf:Ljava/lang/StringBuilder;
    move-object v1, p0

    .line 124
    .local v1, r:Lorg/eclipse/jgit/blame/Region;
    :cond_0
    if-eq v1, p0, :cond_1

    .line 125
    const/16 v2, 0x2c

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 126
    :cond_1
    iget v2, v1, Lorg/eclipse/jgit/blame/Region;->resultStart:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 127
    const/16 v2, 0x2d

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 128
    iget v2, v1, Lorg/eclipse/jgit/blame/Region;->resultStart:I

    iget v3, v1, Lorg/eclipse/jgit/blame/Region;->length:I

    add-int/2addr v2, v3

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 129
    iget-object v1, v1, Lorg/eclipse/jgit/blame/Region;->next:Lorg/eclipse/jgit/blame/Region;

    .line 130
    if-nez v1, :cond_0

    .line 131
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
