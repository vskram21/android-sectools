.class Lorg/eclipse/jgit/revplot/PlotWalk$PlotRefComparator;
.super Ljava/lang/Object;
.source "PlotWalk.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/revplot/PlotWalk;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PlotRefComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lorg/eclipse/jgit/lib/Ref;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/revplot/PlotWalk;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/revplot/PlotWalk;)V
    .locals 0
    .parameter

    .prologue
    .line 149
    iput-object p1, p0, Lorg/eclipse/jgit/revplot/PlotWalk$PlotRefComparator;->this$0:Lorg/eclipse/jgit/revplot/PlotWalk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 149
    check-cast p1, Lorg/eclipse/jgit/lib/Ref;

    .end local p1
    check-cast p2, Lorg/eclipse/jgit/lib/Ref;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/revplot/PlotWalk$PlotRefComparator;->compare(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/Ref;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/Ref;)I
    .locals 9
    .parameter "o1"
    .parameter "o2"

    .prologue
    .line 152
    :try_start_0
    iget-object v7, p0, Lorg/eclipse/jgit/revplot/PlotWalk$PlotRefComparator;->this$0:Lorg/eclipse/jgit/revplot/PlotWalk;

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/eclipse/jgit/revplot/PlotWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v1

    .line 153
    .local v1, obj1:Lorg/eclipse/jgit/revwalk/RevObject;
    iget-object v7, p0, Lorg/eclipse/jgit/revplot/PlotWalk$PlotRefComparator;->this$0:Lorg/eclipse/jgit/revplot/PlotWalk;

    invoke-interface {p2}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/eclipse/jgit/revplot/PlotWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v2

    .line 154
    .local v2, obj2:Lorg/eclipse/jgit/revwalk/RevObject;
    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/revplot/PlotWalk$PlotRefComparator;->timeof(Lorg/eclipse/jgit/revwalk/RevObject;)J

    move-result-wide v3

    .line 155
    .local v3, t1:J
    invoke-virtual {p0, v2}, Lorg/eclipse/jgit/revplot/PlotWalk$PlotRefComparator;->timeof(Lorg/eclipse/jgit/revwalk/RevObject;)J
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v5

    .line 156
    .local v5, t2:J
    cmp-long v7, v3, v5

    if-lez v7, :cond_1

    .line 157
    const/4 v0, -0x1

    .line 167
    .end local v1           #obj1:Lorg/eclipse/jgit/revwalk/RevObject;
    .end local v2           #obj2:Lorg/eclipse/jgit/revwalk/RevObject;
    .end local v3           #t1:J
    .end local v5           #t2:J
    :cond_0
    :goto_0
    return v0

    .line 158
    .restart local v1       #obj1:Lorg/eclipse/jgit/revwalk/RevObject;
    .restart local v2       #obj2:Lorg/eclipse/jgit/revwalk/RevObject;
    .restart local v3       #t1:J
    .restart local v5       #t2:J
    :cond_1
    cmp-long v7, v3, v5

    if-gez v7, :cond_2

    .line 159
    const/4 v0, 0x1

    goto :goto_0

    .line 160
    .end local v1           #obj1:Lorg/eclipse/jgit/revwalk/RevObject;
    .end local v2           #obj2:Lorg/eclipse/jgit/revwalk/RevObject;
    .end local v3           #t1:J
    .end local v5           #t2:J
    :catch_0
    move-exception v7

    .line 164
    :cond_2
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/revplot/PlotWalk$PlotRefComparator;->kind(Lorg/eclipse/jgit/lib/Ref;)I

    move-result v7

    invoke-virtual {p0, p2}, Lorg/eclipse/jgit/revplot/PlotWalk$PlotRefComparator;->kind(Lorg/eclipse/jgit/lib/Ref;)I

    move-result v8

    sub-int v0, v7, v8

    .line 165
    .local v0, cmp:I
    if-nez v0, :cond_0

    .line 166
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-interface {p2}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method

.method kind(Lorg/eclipse/jgit/lib/Ref;)I
    .locals 2
    .parameter "r"

    .prologue
    .line 187
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "refs/tags/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 188
    const/4 v0, 0x0

    .line 193
    :goto_0
    return v0

    .line 189
    :cond_0
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "refs/heads/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 190
    const/4 v0, 0x1

    goto :goto_0

    .line 191
    :cond_1
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "refs/remotes/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 192
    const/4 v0, 0x2

    goto :goto_0

    .line 193
    :cond_2
    const/4 v0, 0x3

    goto :goto_0
.end method

.method timeof(Lorg/eclipse/jgit/revwalk/RevObject;)J
    .locals 6
    .parameter "o"

    .prologue
    const-wide/16 v3, 0x0

    .line 171
    instance-of v5, p1, Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v5, :cond_1

    .line 172
    check-cast p1, Lorg/eclipse/jgit/revwalk/RevCommit;

    .end local p1
    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevCommit;->getCommitTime()I

    move-result v3

    int-to-long v3, v3

    .line 183
    :cond_0
    :goto_0
    return-wide v3

    .line 173
    .restart local p1
    :cond_1
    instance-of v5, p1, Lorg/eclipse/jgit/revwalk/RevTag;

    if-eqz v5, :cond_0

    move-object v1, p1

    .line 174
    check-cast v1, Lorg/eclipse/jgit/revwalk/RevTag;

    .line 176
    .local v1, tag:Lorg/eclipse/jgit/revwalk/RevTag;
    :try_start_0
    iget-object v5, p0, Lorg/eclipse/jgit/revplot/PlotWalk$PlotRefComparator;->this$0:Lorg/eclipse/jgit/revplot/PlotWalk;

    invoke-virtual {v5, v1}, Lorg/eclipse/jgit/revplot/PlotWalk;->parseBody(Lorg/eclipse/jgit/revwalk/RevObject;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 180
    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevTag;->getTaggerIdent()Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v2

    .line 181
    .local v2, who:Lorg/eclipse/jgit/lib/PersonIdent;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/PersonIdent;->getWhen()Ljava/util/Date;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    goto :goto_0

    .line 177
    .end local v2           #who:Lorg/eclipse/jgit/lib/PersonIdent;
    :catch_0
    move-exception v0

    .line 178
    .local v0, e:Ljava/io/IOException;
    goto :goto_0
.end method
