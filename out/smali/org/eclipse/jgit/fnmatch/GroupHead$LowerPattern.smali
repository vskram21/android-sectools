.class final Lorg/eclipse/jgit/fnmatch/GroupHead$LowerPattern;
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
    name = "LowerPattern"
.end annotation


# static fields
.field static final INSTANCE:Lorg/eclipse/jgit/fnmatch/GroupHead$LowerPattern;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 184
    new-instance v0, Lorg/eclipse/jgit/fnmatch/GroupHead$LowerPattern;

    invoke-direct {v0}, Lorg/eclipse/jgit/fnmatch/GroupHead$LowerPattern;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/fnmatch/GroupHead$LowerPattern;->INSTANCE:Lorg/eclipse/jgit/fnmatch/GroupHead$LowerPattern;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 183
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final matches(C)Z
    .locals 1
    .parameter "c"

    .prologue
    .line 187
    invoke-static {p1}, Ljava/lang/Character;->isLowerCase(C)Z

    move-result v0

    return v0
.end method
