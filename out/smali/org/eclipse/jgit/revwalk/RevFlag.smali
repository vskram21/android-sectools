.class public Lorg/eclipse/jgit/revwalk/RevFlag;
.super Ljava/lang/Object;
.source "RevFlag.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/revwalk/RevFlag$StaticRevFlag;
    }
.end annotation


# static fields
.field public static final SEEN:Lorg/eclipse/jgit/revwalk/RevFlag;

.field public static final UNINTERESTING:Lorg/eclipse/jgit/revwalk/RevFlag;


# instance fields
.field final mask:I

.field final name:Ljava/lang/String;

.field final walker:Lorg/eclipse/jgit/revwalk/RevWalk;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 66
    new-instance v0, Lorg/eclipse/jgit/revwalk/RevFlag$StaticRevFlag;

    const-string v1, "UNINTERESTING"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/revwalk/RevFlag$StaticRevFlag;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/revwalk/RevFlag;->UNINTERESTING:Lorg/eclipse/jgit/revwalk/RevFlag;

    .line 79
    new-instance v0, Lorg/eclipse/jgit/revwalk/RevFlag$StaticRevFlag;

    const-string v1, "SEEN"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/revwalk/RevFlag$StaticRevFlag;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/revwalk/RevFlag;->SEEN:Lorg/eclipse/jgit/revwalk/RevFlag;

    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/revwalk/RevWalk;Ljava/lang/String;I)V
    .locals 0
    .parameter "w"
    .parameter "n"
    .parameter "m"

    .prologue
    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    iput-object p1, p0, Lorg/eclipse/jgit/revwalk/RevFlag;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    .line 89
    iput-object p2, p0, Lorg/eclipse/jgit/revwalk/RevFlag;->name:Ljava/lang/String;

    .line 90
    iput p3, p0, Lorg/eclipse/jgit/revwalk/RevFlag;->mask:I

    .line 91
    return-void
.end method


# virtual methods
.method public getRevWalk()Lorg/eclipse/jgit/revwalk/RevWalk;
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevFlag;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevFlag;->name:Ljava/lang/String;

    return-object v0
.end method
