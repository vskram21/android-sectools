.class Lorg/eclipse/jgit/api/NameRevCommand$1;
.super Lorg/eclipse/jgit/revwalk/RevWalk;
.source "NameRevCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/api/NameRevCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/api/NameRevCommand;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/api/NameRevCommand;Lorg/eclipse/jgit/lib/Repository;)V
    .locals 0
    .parameter
    .parameter "x0"

    .prologue
    .line 129
    iput-object p1, p0, Lorg/eclipse/jgit/api/NameRevCommand$1;->this$0:Lorg/eclipse/jgit/api/NameRevCommand;

    invoke-direct {p0, p2}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-void
.end method


# virtual methods
.method public createCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;
    .locals 2
    .parameter "id"

    .prologue
    .line 132
    new-instance v0, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/api/NameRevCommand$1;)V

    return-object v0
.end method

.method public bridge synthetic createCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 1
    .parameter "x0"

    .prologue
    .line 129
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/api/NameRevCommand$1;->createCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;

    move-result-object v0

    return-object v0
.end method
