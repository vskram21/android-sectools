.class public final enum Lorg/eclipse/jgit/transport/TagOpt;
.super Ljava/lang/Enum;
.source "TagOpt.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/transport/TagOpt;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/transport/TagOpt;

.field public static final enum AUTO_FOLLOW:Lorg/eclipse/jgit/transport/TagOpt;

.field public static final enum FETCH_TAGS:Lorg/eclipse/jgit/transport/TagOpt;

.field public static final enum NO_TAGS:Lorg/eclipse/jgit/transport/TagOpt;


# instance fields
.field private final option:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 62
    new-instance v0, Lorg/eclipse/jgit/transport/TagOpt;

    const-string v1, "AUTO_FOLLOW"

    const-string v2, ""

    invoke-direct {v0, v1, v3, v2}, Lorg/eclipse/jgit/transport/TagOpt;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/eclipse/jgit/transport/TagOpt;->AUTO_FOLLOW:Lorg/eclipse/jgit/transport/TagOpt;

    .line 72
    new-instance v0, Lorg/eclipse/jgit/transport/TagOpt;

    const-string v1, "NO_TAGS"

    const-string v2, "--no-tags"

    invoke-direct {v0, v1, v4, v2}, Lorg/eclipse/jgit/transport/TagOpt;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/eclipse/jgit/transport/TagOpt;->NO_TAGS:Lorg/eclipse/jgit/transport/TagOpt;

    .line 81
    new-instance v0, Lorg/eclipse/jgit/transport/TagOpt;

    const-string v1, "FETCH_TAGS"

    const-string v2, "--tags"

    invoke-direct {v0, v1, v5, v2}, Lorg/eclipse/jgit/transport/TagOpt;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/eclipse/jgit/transport/TagOpt;->FETCH_TAGS:Lorg/eclipse/jgit/transport/TagOpt;

    .line 52
    const/4 v0, 0x3

    new-array v0, v0, [Lorg/eclipse/jgit/transport/TagOpt;

    sget-object v1, Lorg/eclipse/jgit/transport/TagOpt;->AUTO_FOLLOW:Lorg/eclipse/jgit/transport/TagOpt;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/transport/TagOpt;->NO_TAGS:Lorg/eclipse/jgit/transport/TagOpt;

    aput-object v1, v0, v4

    sget-object v1, Lorg/eclipse/jgit/transport/TagOpt;->FETCH_TAGS:Lorg/eclipse/jgit/transport/TagOpt;

    aput-object v1, v0, v5

    sput-object v0, Lorg/eclipse/jgit/transport/TagOpt;->$VALUES:[Lorg/eclipse/jgit/transport/TagOpt;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .parameter
    .parameter
    .parameter "o"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 85
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 86
    iput-object p3, p0, Lorg/eclipse/jgit/transport/TagOpt;->option:Ljava/lang/String;

    .line 87
    return-void
.end method

.method public static fromOption(Ljava/lang/String;)Lorg/eclipse/jgit/transport/TagOpt;
    .locals 8
    .parameter "o"

    .prologue
    .line 106
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_2

    .line 107
    :cond_0
    sget-object v3, Lorg/eclipse/jgit/transport/TagOpt;->AUTO_FOLLOW:Lorg/eclipse/jgit/transport/TagOpt;

    .line 110
    :cond_1
    return-object v3

    .line 108
    :cond_2
    invoke-static {}, Lorg/eclipse/jgit/transport/TagOpt;->values()[Lorg/eclipse/jgit/transport/TagOpt;

    move-result-object v0

    .local v0, arr$:[Lorg/eclipse/jgit/transport/TagOpt;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_3

    aget-object v3, v0, v1

    .line 109
    .local v3, tagopt:Lorg/eclipse/jgit/transport/TagOpt;
    invoke-virtual {v3}, Lorg/eclipse/jgit/transport/TagOpt;->option()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 108
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 112
    .end local v3           #tagopt:Lorg/eclipse/jgit/transport/TagOpt;
    :cond_3
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->invalidTagOption:Ljava/lang/String;

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p0, v6, v7

    invoke-static {v5, v6}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/transport/TagOpt;
    .locals 1
    .parameter "name"

    .prologue
    .line 52
    const-class v0, Lorg/eclipse/jgit/transport/TagOpt;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/transport/TagOpt;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/transport/TagOpt;
    .locals 1

    .prologue
    .line 52
    sget-object v0, Lorg/eclipse/jgit/transport/TagOpt;->$VALUES:[Lorg/eclipse/jgit/transport/TagOpt;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/transport/TagOpt;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/transport/TagOpt;

    return-object v0
.end method


# virtual methods
.method public option()Ljava/lang/String;
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TagOpt;->option:Ljava/lang/String;

    return-object v0
.end method
