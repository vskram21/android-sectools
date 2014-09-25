.class public Lorg/eclipse/jgit/diff/Edit;
.super Ljava/lang/Object;
.source "Edit.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/diff/Edit$Type;
    }
.end annotation


# instance fields
.field beginA:I

.field beginB:I

.field endA:I

.field endB:I


# direct methods
.method public constructor <init>(II)V
    .locals 0
    .parameter "as"
    .parameter "bs"

    .prologue
    .line 99
    invoke-direct {p0, p1, p1, p2, p2}, Lorg/eclipse/jgit/diff/Edit;-><init>(IIII)V

    .line 100
    return-void
.end method

.method public constructor <init>(IIII)V
    .locals 0
    .parameter "as"
    .parameter "ae"
    .parameter "bs"
    .parameter "be"

    .prologue
    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 115
    iput p1, p0, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    .line 116
    iput p2, p0, Lorg/eclipse/jgit/diff/Edit;->endA:I

    .line 118
    iput p3, p0, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    .line 119
    iput p4, p0, Lorg/eclipse/jgit/diff/Edit;->endB:I

    .line 120
    return-void
.end method


# virtual methods
.method public final after(Lorg/eclipse/jgit/diff/Edit;)Lorg/eclipse/jgit/diff/Edit;
    .locals 5
    .parameter "cut"

    .prologue
    .line 196
    new-instance v0, Lorg/eclipse/jgit/diff/Edit;

    iget v1, p1, Lorg/eclipse/jgit/diff/Edit;->endA:I

    iget v2, p0, Lorg/eclipse/jgit/diff/Edit;->endA:I

    iget v3, p1, Lorg/eclipse/jgit/diff/Edit;->endB:I

    iget v4, p0, Lorg/eclipse/jgit/diff/Edit;->endB:I

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/eclipse/jgit/diff/Edit;-><init>(IIII)V

    return-object v0
.end method

.method public final before(Lorg/eclipse/jgit/diff/Edit;)Lorg/eclipse/jgit/diff/Edit;
    .locals 5
    .parameter "cut"

    .prologue
    .line 183
    new-instance v0, Lorg/eclipse/jgit/diff/Edit;

    iget v1, p0, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    iget v2, p1, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    iget v3, p0, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    iget v4, p1, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/eclipse/jgit/diff/Edit;-><init>(IIII)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .parameter "o"

    .prologue
    const/4 v1, 0x0

    .line 228
    instance-of v2, p1, Lorg/eclipse/jgit/diff/Edit;

    if-eqz v2, :cond_0

    move-object v0, p1

    .line 229
    check-cast v0, Lorg/eclipse/jgit/diff/Edit;

    .line 230
    .local v0, e:Lorg/eclipse/jgit/diff/Edit;
    iget v2, p0, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    iget v3, v0, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    if-ne v2, v3, :cond_0

    iget v2, p0, Lorg/eclipse/jgit/diff/Edit;->endA:I

    iget v3, v0, Lorg/eclipse/jgit/diff/Edit;->endA:I

    if-ne v2, v3, :cond_0

    iget v2, p0, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    iget v3, v0, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    if-ne v2, v3, :cond_0

    iget v2, p0, Lorg/eclipse/jgit/diff/Edit;->endB:I

    iget v3, v0, Lorg/eclipse/jgit/diff/Edit;->endB:I

    if-ne v2, v3, :cond_0

    const/4 v1, 0x1

    .line 233
    .end local v0           #e:Lorg/eclipse/jgit/diff/Edit;
    :cond_0
    return v1
.end method

.method public extendA()V
    .locals 1

    .prologue
    .line 201
    iget v0, p0, Lorg/eclipse/jgit/diff/Edit;->endA:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/eclipse/jgit/diff/Edit;->endA:I

    .line 202
    return-void
.end method

.method public extendB()V
    .locals 1

    .prologue
    .line 206
    iget v0, p0, Lorg/eclipse/jgit/diff/Edit;->endB:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/eclipse/jgit/diff/Edit;->endB:I

    .line 207
    return-void
.end method

.method public final getBeginA()I
    .locals 1

    .prologue
    .line 145
    iget v0, p0, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    return v0
.end method

.method public final getBeginB()I
    .locals 1

    .prologue
    .line 155
    iget v0, p0, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    return v0
.end method

.method public final getEndA()I
    .locals 1

    .prologue
    .line 150
    iget v0, p0, Lorg/eclipse/jgit/diff/Edit;->endA:I

    return v0
.end method

.method public final getEndB()I
    .locals 1

    .prologue
    .line 160
    iget v0, p0, Lorg/eclipse/jgit/diff/Edit;->endB:I

    return v0
.end method

.method public final getLengthA()I
    .locals 2

    .prologue
    .line 165
    iget v0, p0, Lorg/eclipse/jgit/diff/Edit;->endA:I

    iget v1, p0, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public final getLengthB()I
    .locals 2

    .prologue
    .line 170
    iget v0, p0, Lorg/eclipse/jgit/diff/Edit;->endB:I

    iget v1, p0, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public final getType()Lorg/eclipse/jgit/diff/Edit$Type;
    .locals 2

    .prologue
    .line 124
    iget v0, p0, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    iget v1, p0, Lorg/eclipse/jgit/diff/Edit;->endA:I

    if-ge v0, v1, :cond_1

    .line 125
    iget v0, p0, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    iget v1, p0, Lorg/eclipse/jgit/diff/Edit;->endB:I

    if-ge v0, v1, :cond_0

    .line 126
    sget-object v0, Lorg/eclipse/jgit/diff/Edit$Type;->REPLACE:Lorg/eclipse/jgit/diff/Edit$Type;

    .line 134
    :goto_0
    return-object v0

    .line 128
    :cond_0
    sget-object v0, Lorg/eclipse/jgit/diff/Edit$Type;->DELETE:Lorg/eclipse/jgit/diff/Edit$Type;

    goto :goto_0

    .line 131
    :cond_1
    iget v0, p0, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    iget v1, p0, Lorg/eclipse/jgit/diff/Edit;->endB:I

    if-ge v0, v1, :cond_2

    .line 132
    sget-object v0, Lorg/eclipse/jgit/diff/Edit$Type;->INSERT:Lorg/eclipse/jgit/diff/Edit$Type;

    goto :goto_0

    .line 134
    :cond_2
    sget-object v0, Lorg/eclipse/jgit/diff/Edit$Type;->EMPTY:Lorg/eclipse/jgit/diff/Edit$Type;

    goto :goto_0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 223
    iget v0, p0, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    iget v1, p0, Lorg/eclipse/jgit/diff/Edit;->endA:I

    xor-int/2addr v0, v1

    return v0
.end method

.method public final isEmpty()Z
    .locals 2

    .prologue
    .line 140
    iget v0, p0, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    iget v1, p0, Lorg/eclipse/jgit/diff/Edit;->endA:I

    if-ne v0, v1, :cond_0

    iget v0, p0, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    iget v1, p0, Lorg/eclipse/jgit/diff/Edit;->endB:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public swap()V
    .locals 3

    .prologue
    .line 211
    iget v0, p0, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    .line 212
    .local v0, sBegin:I
    iget v1, p0, Lorg/eclipse/jgit/diff/Edit;->endA:I

    .line 214
    .local v1, sEnd:I
    iget v2, p0, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    iput v2, p0, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    .line 215
    iget v2, p0, Lorg/eclipse/jgit/diff/Edit;->endB:I

    iput v2, p0, Lorg/eclipse/jgit/diff/Edit;->endA:I

    .line 217
    iput v0, p0, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    .line 218
    iput v1, p0, Lorg/eclipse/jgit/diff/Edit;->endB:I

    .line 219
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 239
    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/Edit;->getType()Lorg/eclipse/jgit/diff/Edit$Type;

    move-result-object v0

    .line 240
    .local v0, t:Lorg/eclipse/jgit/diff/Edit$Type;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/eclipse/jgit/diff/Edit;->endA:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/eclipse/jgit/diff/Edit;->endB:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
