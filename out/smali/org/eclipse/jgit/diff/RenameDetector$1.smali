.class final Lorg/eclipse/jgit/diff/RenameDetector$1;
.super Ljava/lang/Object;
.source "RenameDetector.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/diff/RenameDetector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lorg/eclipse/jgit/diff/DiffEntry;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private nameOf(Lorg/eclipse/jgit/diff/DiffEntry;)Ljava/lang/String;
    .locals 2
    .parameter "ent"

    .prologue
    .line 85
    iget-object v0, p1, Lorg/eclipse/jgit/diff/DiffEntry;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->DELETE:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    if-ne v0, v1, :cond_0

    .line 86
    iget-object v0, p1, Lorg/eclipse/jgit/diff/DiffEntry;->oldPath:Ljava/lang/String;

    .line 87
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p1, Lorg/eclipse/jgit/diff/DiffEntry;->newPath:Ljava/lang/String;

    goto :goto_0
.end method

.method private sortOf(Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;)I
    .locals 2
    .parameter "changeType"

    .prologue
    .line 95
    sget-object v0, Lorg/eclipse/jgit/diff/RenameDetector$2;->$SwitchMap$org$eclipse$jgit$diff$DiffEntry$ChangeType:[I

    invoke-virtual {p1}, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 101
    const/16 v0, 0xa

    :goto_0
    return v0

    .line 97
    :pswitch_0
    const/4 v0, 0x1

    goto :goto_0

    .line 99
    :pswitch_1
    const/4 v0, 0x2

    goto :goto_0

    .line 95
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 72
    check-cast p1, Lorg/eclipse/jgit/diff/DiffEntry;

    .end local p1
    check-cast p2, Lorg/eclipse/jgit/diff/DiffEntry;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/diff/RenameDetector$1;->compare(Lorg/eclipse/jgit/diff/DiffEntry;Lorg/eclipse/jgit/diff/DiffEntry;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/eclipse/jgit/diff/DiffEntry;Lorg/eclipse/jgit/diff/DiffEntry;)I
    .locals 3
    .parameter "a"
    .parameter "b"

    .prologue
    .line 74
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/diff/RenameDetector$1;->nameOf(Lorg/eclipse/jgit/diff/DiffEntry;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p2}, Lorg/eclipse/jgit/diff/RenameDetector$1;->nameOf(Lorg/eclipse/jgit/diff/DiffEntry;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    .line 75
    .local v0, cmp:I
    if-nez v0, :cond_0

    .line 76
    invoke-virtual {p1}, Lorg/eclipse/jgit/diff/DiffEntry;->getChangeType()Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/eclipse/jgit/diff/RenameDetector$1;->sortOf(Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;)I

    move-result v1

    invoke-virtual {p2}, Lorg/eclipse/jgit/diff/DiffEntry;->getChangeType()Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/eclipse/jgit/diff/RenameDetector$1;->sortOf(Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;)I

    move-result v2

    sub-int v0, v1, v2

    .line 77
    :cond_0
    return v0
.end method
