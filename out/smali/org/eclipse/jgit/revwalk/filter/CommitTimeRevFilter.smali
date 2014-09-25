.class public abstract Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter;
.super Lorg/eclipse/jgit/revwalk/filter/RevFilter;
.source "CommitTimeRevFilter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter$After;,
        Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter$Before;,
        Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter$Between;
    }
.end annotation


# instance fields
.field final when:I


# direct methods
.method constructor <init>(J)V
    .locals 2
    .parameter "ts"

    .prologue
    .line 128
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;-><init>()V

    .line 129
    const-wide/16 v0, 0x3e8

    div-long v0, p1, v0

    long-to-int v0, v0

    iput v0, p0, Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter;->when:I

    .line 130
    return-void
.end method

.method public static final after(J)Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 1
    .parameter "ts"

    .prologue
    .line 99
    new-instance v0, Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter$After;

    invoke-direct {v0, p0, p1}, Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter$After;-><init>(J)V

    return-object v0
.end method

.method public static final after(Ljava/util/Date;)Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 2
    .parameter "ts"

    .prologue
    .line 88
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter;->after(J)Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v0

    return-object v0
.end method

.method public static final before(J)Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 1
    .parameter "ts"

    .prologue
    .line 77
    new-instance v0, Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter$Before;

    invoke-direct {v0, p0, p1}, Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter$Before;-><init>(J)V

    return-object v0
.end method

.method public static final before(Ljava/util/Date;)Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 2
    .parameter "ts"

    .prologue
    .line 66
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter;->before(J)Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v0

    return-object v0
.end method

.method public static final between(JJ)Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 1
    .parameter "since"
    .parameter "until"

    .prologue
    .line 123
    new-instance v0, Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter$Between;

    invoke-direct {v0, p0, p1, p2, p3}, Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter$Between;-><init>(JJ)V

    return-object v0
.end method

.method public static final between(Ljava/util/Date;Ljava/util/Date;)Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 4
    .parameter "since"
    .parameter "until"

    .prologue
    .line 111
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter;->between(JJ)Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 57
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter;->clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 0

    .prologue
    .line 134
    return-object p0
.end method

.method public requiresCommitBody()Z
    .locals 1

    .prologue
    .line 139
    const/4 v0, 0x0

    return v0
.end method
