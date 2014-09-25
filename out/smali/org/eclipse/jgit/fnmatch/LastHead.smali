.class final Lorg/eclipse/jgit/fnmatch/LastHead;
.super Ljava/lang/Object;
.source "LastHead.java"

# interfaces
.implements Lorg/eclipse/jgit/fnmatch/Head;


# static fields
.field static final INSTANCE:Lorg/eclipse/jgit/fnmatch/Head;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 50
    new-instance v0, Lorg/eclipse/jgit/fnmatch/LastHead;

    invoke-direct {v0}, Lorg/eclipse/jgit/fnmatch/LastHead;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/fnmatch/LastHead;->INSTANCE:Lorg/eclipse/jgit/fnmatch/Head;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    return-void
.end method


# virtual methods
.method public getNextHeads(C)Ljava/util/List;
    .locals 1
    .parameter "c"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(C)",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/fnmatch/Head;",
            ">;"
        }
    .end annotation

    .prologue
    .line 60
    sget-object v0, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->EMPTY_HEAD_LIST:Ljava/util/List;

    return-object v0
.end method
