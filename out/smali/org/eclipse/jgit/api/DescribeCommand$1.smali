.class Lorg/eclipse/jgit/api/DescribeCommand$1;
.super Ljava/lang/Object;
.source "DescribeCommand.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/api/DescribeCommand;->call()Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/api/DescribeCommand;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/api/DescribeCommand;)V
    .locals 0
    .parameter

    .prologue
    .line 271
    iput-object p1, p0, Lorg/eclipse/jgit/api/DescribeCommand$1;->this$0:Lorg/eclipse/jgit/api/DescribeCommand;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 271
    check-cast p1, Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;

    .end local p1
    check-cast p2, Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/api/DescribeCommand$1;->compare(Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;)I
    .locals 2
    .parameter "o1"
    .parameter "o2"

    .prologue
    .line 273
    iget v0, p1, Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;->depth:I

    iget v1, p2, Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;->depth:I

    sub-int/2addr v0, v1

    return v0
.end method
