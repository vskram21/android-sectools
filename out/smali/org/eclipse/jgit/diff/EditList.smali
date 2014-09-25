.class public Lorg/eclipse/jgit/diff/EditList;
.super Ljava/util/ArrayList;
.source "EditList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/ArrayList",
        "<",
        "Lorg/eclipse/jgit/diff/Edit;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 67
    const/16 v0, 0x10

    invoke-direct {p0, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 68
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .parameter "capacity"

    .prologue
    .line 78
    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(I)V

    .line 79
    return-void
.end method

.method public static singleton(Lorg/eclipse/jgit/diff/Edit;)Lorg/eclipse/jgit/diff/EditList;
    .locals 2
    .parameter "edit"

    .prologue
    .line 60
    new-instance v0, Lorg/eclipse/jgit/diff/EditList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/diff/EditList;-><init>(I)V

    .line 61
    .local v0, res:Lorg/eclipse/jgit/diff/EditList;
    invoke-virtual {v0, p0}, Lorg/eclipse/jgit/diff/EditList;->add(Ljava/lang/Object;)Z

    .line 62
    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 83
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "EditList"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-super {p0}, Ljava/util/ArrayList;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
