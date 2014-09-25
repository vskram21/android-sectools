.class final Lorg/eclipse/jgit/fnmatch/GroupHead$UpperPattern;
.super Ljava/lang/Object;
.source "GroupHead.java"

# interfaces
.implements Lorg/eclipse/jgit/fnmatch/GroupHead$CharacterPattern;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/fnmatch/GroupHead;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "UpperPattern"
.end annotation


# static fields
.field static final INSTANCE:Lorg/eclipse/jgit/fnmatch/GroupHead$UpperPattern;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 192
    new-instance v0, Lorg/eclipse/jgit/fnmatch/GroupHead$UpperPattern;

    invoke-direct {v0}, Lorg/eclipse/jgit/fnmatch/GroupHead$UpperPattern;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/fnmatch/GroupHead$UpperPattern;->INSTANCE:Lorg/eclipse/jgit/fnmatch/GroupHead$UpperPattern;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 191
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final matches(C)Z
    .locals 1
    .parameter "c"

    .prologue
    .line 195
    invoke-static {p1}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v0

    return v0
.end method
