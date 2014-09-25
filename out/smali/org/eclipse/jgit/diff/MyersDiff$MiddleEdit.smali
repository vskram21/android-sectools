.class Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;
.super Ljava/lang/Object;
.source "MyersDiff.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/diff/MyersDiff;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MiddleEdit"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$BackwardEditPaths;,
        Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;,
        Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$ForwardEditPaths;
    }
.end annotation


# instance fields
.field backward:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/diff/MyersDiff",
            "<TS;>.MiddleEdit.EditPaths;"
        }
    .end annotation
.end field

.field protected beginA:I

.field protected beginB:I

.field protected edit:Lorg/eclipse/jgit/diff/Edit;

.field protected endA:I

.field protected endB:I

.field forward:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/diff/MyersDiff",
            "<TS;>.MiddleEdit.EditPaths;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lorg/eclipse/jgit/diff/MyersDiff;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/diff/MyersDiff;)V
    .locals 1
    .parameter

    .prologue
    .line 216
    .local p0, this:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;,"Lorg/eclipse/jgit/diff/MyersDiff<TS;>.MiddleEdit;"
    iput-object p1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->this$0:Lorg/eclipse/jgit/diff/MyersDiff;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 300
    new-instance v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$ForwardEditPaths;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$ForwardEditPaths;-><init>(Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;)V

    iput-object v0, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->forward:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;

    .line 301
    new-instance v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$BackwardEditPaths;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$BackwardEditPaths;-><init>(Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;)V

    iput-object v0, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->backward:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;

    .line 498
    return-void
.end method


# virtual methods
.method calculate(IIII)Lorg/eclipse/jgit/diff/Edit;
    .locals 5
    .parameter "beginA"
    .parameter "endA"
    .parameter "beginB"
    .parameter "endB"

    .prologue
    .line 243
    .local p0, this:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;,"Lorg/eclipse/jgit/diff/MyersDiff<TS;>.MiddleEdit;"
    if-eq p1, p2, :cond_0

    if-ne p3, p4, :cond_1

    .line 244
    :cond_0
    new-instance v3, Lorg/eclipse/jgit/diff/Edit;

    invoke-direct {v3, p1, p2, p3, p4}, Lorg/eclipse/jgit/diff/Edit;-><init>(IIII)V

    .line 262
    :goto_0
    return-object v3

    .line 245
    :cond_1
    iput p1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->beginA:I

    iput p2, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->endA:I

    .line 246
    iput p3, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->beginB:I

    iput p4, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->endB:I

    .line 253
    sub-int v2, p3, p2

    .line 254
    .local v2, minK:I
    sub-int v1, p4, p1

    .line 256
    .local v1, maxK:I
    iget-object v3, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->forward:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;

    sub-int v4, p3, p1

    invoke-virtual {v3, v4, p1, v2, v1}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->initialize(IIII)V

    .line 257
    iget-object v3, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->backward:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;

    sub-int v4, p4, p2

    invoke-virtual {v3, v4, p2, v2, v1}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->initialize(IIII)V

    .line 259
    const/4 v0, 0x1

    .line 260
    .local v0, d:I
    :goto_1
    iget-object v3, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->forward:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;

    invoke-virtual {v3, v0}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->calculate(I)Z

    move-result v3

    if-nez v3, :cond_2

    iget-object v3, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->backward:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;

    invoke-virtual {v3, v0}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->calculate(I)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 262
    :cond_2
    iget-object v3, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->edit:Lorg/eclipse/jgit/diff/Edit;

    goto :goto_0

    .line 259
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method initialize(IIII)V
    .locals 2
    .parameter "beginA"
    .parameter "endA"
    .parameter "beginB"
    .parameter "endB"

    .prologue
    .line 218
    .local p0, this:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;,"Lorg/eclipse/jgit/diff/MyersDiff<TS;>.MiddleEdit;"
    iput p1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->beginA:I

    iput p2, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->endA:I

    .line 219
    iput p3, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->beginB:I

    iput p4, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->endB:I

    .line 222
    sub-int v0, p3, p1

    .line 223
    .local v0, k:I
    iget-object v1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->forward:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;

    invoke-virtual {v1, v0, p1}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->snake(II)I

    move-result v1

    iput v1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->beginA:I

    .line 224
    iget v1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->beginA:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->beginB:I

    .line 226
    sub-int v0, p4, p2

    .line 227
    iget-object v1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->backward:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;

    invoke-virtual {v1, v0, p2}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->snake(II)I

    move-result v1

    iput v1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->endA:I

    .line 228
    iget v1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->endA:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->endB:I

    .line 229
    return-void
.end method
