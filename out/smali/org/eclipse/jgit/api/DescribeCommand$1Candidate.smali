.class Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;
.super Ljava/lang/Object;
.source "DescribeCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/api/DescribeCommand;->call()Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Candidate"
.end annotation


# instance fields
.field depth:I

.field final flag:Lorg/eclipse/jgit/revwalk/RevFlag;

.field final tag:Lorg/eclipse/jgit/lib/Ref;

.field final synthetic this$0:Lorg/eclipse/jgit/api/DescribeCommand;

.field final synthetic val$allFlags:Lorg/eclipse/jgit/revwalk/RevFlagSet;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/api/DescribeCommand;Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/revwalk/RevFlagSet;)V
    .locals 2
    .parameter
    .parameter "commit"
    .parameter "tag"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/revwalk/RevCommit;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ")V"
        }
    .end annotation

    .prologue
    .line 183
    iput-object p1, p0, Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;->this$0:Lorg/eclipse/jgit/api/DescribeCommand;

    iput-object p4, p0, Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;->val$allFlags:Lorg/eclipse/jgit/revwalk/RevFlagSet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 184
    iput-object p3, p0, Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;->tag:Lorg/eclipse/jgit/lib/Ref;

    .line 185
    #getter for: Lorg/eclipse/jgit/api/DescribeCommand;->w:Lorg/eclipse/jgit/revwalk/RevWalk;
    invoke-static {p1}, Lorg/eclipse/jgit/api/DescribeCommand;->access$000(Lorg/eclipse/jgit/api/DescribeCommand;)Lorg/eclipse/jgit/revwalk/RevWalk;

    move-result-object v0

    invoke-interface {p3}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->newFlag(Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevFlag;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;->flag:Lorg/eclipse/jgit/revwalk/RevFlag;

    .line 187
    iget-object v0, p0, Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;->val$allFlags:Lorg/eclipse/jgit/revwalk/RevFlagSet;

    iget-object v1, p0, Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;->flag:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevFlagSet;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    .line 188
    #getter for: Lorg/eclipse/jgit/api/DescribeCommand;->w:Lorg/eclipse/jgit/revwalk/RevWalk;
    invoke-static {p1}, Lorg/eclipse/jgit/api/DescribeCommand;->access$000(Lorg/eclipse/jgit/api/DescribeCommand;)Lorg/eclipse/jgit/revwalk/RevWalk;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;->flag:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->carry(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 189
    iget-object v0, p0, Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;->flag:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p2, v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 194
    iget-object v0, p0, Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;->flag:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p2, v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->carry(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 195
    return-void
.end method


# virtual methods
.method describe(Lorg/eclipse/jgit/lib/ObjectId;)Ljava/lang/String;
    .locals 5
    .parameter "tip"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 205
    const-string v0, "%s-%d-g%s"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;->tag:Lorg/eclipse/jgit/lib/Ref;

    invoke-interface {v3}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "refs/tags/"

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget v3, p0, Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;->depth:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-object v3, p0, Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;->this$0:Lorg/eclipse/jgit/api/DescribeCommand;

    #getter for: Lorg/eclipse/jgit/api/DescribeCommand;->w:Lorg/eclipse/jgit/revwalk/RevWalk;
    invoke-static {v3}, Lorg/eclipse/jgit/api/DescribeCommand;->access$000(Lorg/eclipse/jgit/api/DescribeCommand;)Lorg/eclipse/jgit/revwalk/RevWalk;

    move-result-object v3

    invoke-virtual {v3}, Lorg/eclipse/jgit/revwalk/RevWalk;->getObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v3

    invoke-virtual {v3, p1}, Lorg/eclipse/jgit/lib/ObjectReader;->abbreviate(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v3

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->name()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method reaches(Lorg/eclipse/jgit/revwalk/RevCommit;)Z
    .locals 1
    .parameter "c"

    .prologue
    .line 201
    iget-object v0, p0, Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;->flag:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v0

    return v0
.end method
